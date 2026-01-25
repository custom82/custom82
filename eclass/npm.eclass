# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# npm.eclass (overlay-local)
#
# Features:
# - Default SRC_URI for npm registry tarballs (based on NPM_MODULE)
# - Robust unpack: detects unpack dir containing package.json and *normalizes* it into ${S}
#   (usually ${WORKDIR}/${P}) via mv/rm -rf, so Portage sees the standard S.
# - Auto-populates NPM_EXTRA_FILES for registry tarballs by reading package.json:
#     * Prefer "files" (globs expanded)
#     * Otherwise derive from entrypoints: main/module/types/typings/browser/bin/exports
#     * Finally fallback to NPM_POPULATE_FALLBACK (default: dist) if it exists
# - Installs module payload into /usr/$(get_libdir)/node_modules/<NPM_MODULE>
#
# IMPORTANT:
# - This eclass does NOT run "npm install" or "npm pack".

inherit multilib

# User variables
: "${NPM_MODULE:=${PN}}"

# Manual install lists (you can still set these in the ebuild)
: "${NPM_FILES:=package.json}"
: "${NPM_EXTRA_FILES:=}"

# Auto-populate controls
: "${NPM_POPULATE_EXTRA_FILES:=}"    # default: 1 for registry
: "${NPM_POPULATE_FALLBACK:=dist}"

# Optional docs/bins
: "${NPM_DOCS:=}"
: "${NPM_BIN:=}"

# Derived variables for registry tarballs
if [[ ${NPM_MODULE} == */* ]]; then
	NPM_PN=${NPM_MODULE##*/}
else
	NPM_PN=${NPM_MODULE}
fi
: "${NPM_REGISTRY_TARBALL:=${NPM_PN}}"

# Default SRC_URI for npm registry tarballs if the ebuild did not set it.
if [[ -z ${SRC_URI} ]]; then
	SRC_URI="https://registry.npmjs.org/${NPM_MODULE}/-/${NPM_REGISTRY_TARBALL}-${PV}.tgz -> ${P}.tgz"
fi

# Default: enable populate for registry tarballs
if [[ -z ${NPM_POPULATE_EXTRA_FILES} ]] && [[ ${SRC_URI} == https://registry.npmjs.org/* ]]; then
	NPM_POPULATE_EXTRA_FILES=1
fi

_npm_detect_dir_with_package_json() {
	# Echo absolute path of a directory under ${WORKDIR} that contains package.json.
	# Preference order:
	#  1) ${WORKDIR}/package
	#  2) ${WORKDIR}/${P}
	#  3) single top-level directory (if exactly one) that contains package.json
	#  4) first directory found (depth<=2) that contains package.json
	[[ -f ${WORKDIR}/package/package.json ]] && { echo "${WORKDIR}/package"; return 0; }
	[[ -f ${WORKDIR}/${P}/package.json ]] && { echo "${WORKDIR}/${P}"; return 0; }

	local dirs=() d cand
	while IFS= read -r -d '' d; do dirs+=("${d}"); done < <(find "${WORKDIR}" -mindepth 1 -maxdepth 1 -type d -print0)
	if [[ ${#dirs[@]} -eq 1 ]]; then
		cand="${dirs[0]}"
		[[ -f ${cand}/package.json ]] && { echo "${cand}"; return 0; }
	fi

	cand="$(find "${WORKDIR}" -mindepth 2 -maxdepth 2 -type f -name package.json -printf '%h\n' | head -n 1)"
	[[ -n ${cand} ]] && { echo "${cand}"; return 0; }

	return 1
}

npm_src_unpack() {
	if [[ ${SRC_URI} == https://registry.npmjs.org/* ]]; then
		unpack "${A}" || die

		# Ensure ${S} exists and contains package.json. Prefer standard Portage S=${WORKDIR}/${P}.
		# If ebuild did not set S, Portage default is already ${WORKDIR}/${P}.
		if [[ -d ${S} && -f ${S}/package.json ]]; then
			return 0
		fi

		local detected
		detected="$(_npm_detect_dir_with_package_json)" \
			|| die "npm_src_unpack: could not detect unpacked source dir (no package.json found under ${WORKDIR})"

		[[ ${detected} == ${WORKDIR}/* ]] || die "npm_src_unpack: refusing to move dir outside WORKDIR: ${detected}"

		# Normalize detected -> S
		if [[ ${detected} != ${S} ]]; then
			rm -rf "${S}" || die
			mv "${detected}" "${S}" || die
		fi

		[[ -f ${S}/package.json ]] || die "npm_src_unpack: package.json missing in ${S} after normalization"
	else
		default
	fi
}

_npm_guess_extra_files_from_pkgjson() {
	# Outputs space-separated list of TOP-LEVEL paths to install (excluding package.json)
	python - <<'PY' || return 1
import json, os, glob, sys

S = os.environ["S"]
fallback = os.environ.get("NPM_POPULATE_FALLBACK", "dist")

pkg = os.path.join(S, "package.json")
with open(pkg, "r", encoding="utf-8") as f:
    data = json.load(f)

paths = set()

def add_path(rel):
    if not rel or rel in (".", "package.json"):
        return
    rel = rel.lstrip("./").replace("\\", "/")
    if rel:
        paths.add(rel)

def add_ref(val):
    if isinstance(val, str):
        add_path(val)
    elif isinstance(val, list):
        for x in val:
            add_ref(x)
    elif isinstance(val, dict):
        for x in val.values():
            add_ref(x)

files = data.get("files")
if isinstance(files, list) and files:
    for pat in files:
        if not isinstance(pat, str) or not pat.strip():
            continue
        for m in glob.glob(os.path.join(S, pat), recursive=True):
            rel = os.path.relpath(m, S).replace("\\", "/")
            add_path(rel)
else:
    for key in ("main", "module", "types", "typings", "browser"):
        add_ref(data.get(key))
    add_ref(data.get("bin"))
    add_ref(data.get("exports"))

# If still empty, fallback dir if exists
if not paths:
    fb = os.path.join(S, fallback)
    if os.path.exists(fb):
        add_path(fallback)

# Collapse to top-level items
top = set(p.split("/", 1)[0] for p in paths if p)

# Drop common dev-only dirs if they were included via broad globs
for noise in ("test", "tests", "__tests__", "example", "examples", "script", "scripts"):
    top.discard(noise)

sys.stdout.write(" ".join(sorted(top)))
PY
}

npm_src_prepare() {
	default

	# Populate NPM_EXTRA_FILES automatically (only if requested and currently empty)
	if [[ ${NPM_POPULATE_EXTRA_FILES} == 1 ]] && [[ -z ${NPM_EXTRA_FILES} ]] && [[ -f ${S}/package.json ]]; then
		local guessed
		guessed="$(_npm_guess_extra_files_from_pkgjson)" || guessed=""
		if [[ -n ${guessed} ]]; then
			NPM_EXTRA_FILES="${guessed}"
		elif [[ -d ${S}/${NPM_POPULATE_FALLBACK} ]]; then
			NPM_EXTRA_FILES="${NPM_POPULATE_FALLBACK}"
		fi
	fi
}

npm_src_compile() { :; }

npm_src_install() {
	local node_modules_dir="${ED}/usr/$(get_libdir)/node_modules/${NPM_MODULE}"
	local npm_files="${NPM_FILES} ${NPM_EXTRA_FILES}"

	mkdir -p "${node_modules_dir}" || die "Could not create ${node_modules_dir}"
	insinto "/usr/$(get_libdir)/node_modules/${NPM_MODULE}"

	local f
	for f in ${npm_files}; do
		[[ -e "${S}/${f}" ]] || continue
		if [[ -d "${S}/${f}" ]]; then
			doins -r "${S}/${f}" || die "Failed to install dir: ${f}"
		else
			doins "${S}/${f}" || die "Failed to install file: ${f}"
		fi
	done

	# docs (keep in /usr/share/doc as Gentoo expects)
	for f in README* readme* HISTORY* ChangeLog AUTHORS NEWS TODO CHANGES \
			THANKS BUGS FAQ CREDITS CHANGELOG* LICENSE* COPYING*; do
		[[ -s "${S}/${f}" ]] && dodoc "${S}/${f}"
	done

	if in_iuse doc && use doc; then
		for f in ${NPM_DOCS}; do
			[[ -e "${S}/${f}" ]] || continue
			dodoc -r "${S}/${f}" || die "Failed to install docs: ${f}"
		done
	fi

	if [[ -n "${NPM_BIN}" ]]; then
		for f in ${NPM_BIN}; do
			[[ -f "${S}/bin/${f}" ]] && dobin "${S}/bin/${f}"
		done
	fi
}

EXPORT_FUNCTIONS src_unpack src_prepare src_compile src_install
