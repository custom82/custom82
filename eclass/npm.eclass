# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# npm.eclass (overlay-local)
#
# Features:
# - Default SRC_URI/S for npm registry tarballs (based on NPM_MODULE)
# - For registry tarballs, can automatically populate NPM_EXTRA_FILES from package.json "files"
# - Installs module payload into /usr/$(get_libdir)/node_modules/<NPM_MODULE>
#
# IMPORTANT:
# - This eclass does NOT run "npm install" or "npm pack".
# - Auto population happens in src_prepare (after unpack), because package.json is not available earlier.

inherit multilib

# User variables
: "${NPM_MODULE:=${PN}}"

# Manual install lists (you can still set these in the ebuild)
: "${NPM_FILES:=package.json}"
: "${NPM_EXTRA_FILES:=}"

# Auto-populate controls
# If 1, populate NPM_EXTRA_FILES from package.json "files" (only when empty).
# Default: enabled for registry tarballs.
: "${NPM_POPULATE_EXTRA_FILES:=}"
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
: "${NPM_PN:=${NPM_MODULE}}"
: "${NPM_REGISTRY_TARBALL:=${NPM_PN}}"

# Default SRC_URI for npm registry tarballs if the ebuild did not set it.
if [[ -z ${SRC_URI} ]]; then
	SRC_URI="https://registry.npmjs.org/${NPM_MODULE}/-/${NPM_REGISTRY_TARBALL}-${PV}.tgz -> ${P}.tgz"
fi

# Default S for npm registry tarballs
if [[ -z ${S} ]]; then
	S="${WORKDIR}/package"
fi

# Default: enable populate for registry tarballs
if [[ -z ${NPM_POPULATE_EXTRA_FILES} ]] && [[ ${SRC_URI} == https://registry.npmjs.org/* ]]; then
	NPM_POPULATE_EXTRA_FILES=1
fi

npm_src_unpack() {
	if [[ ${SRC_URI} == https://registry.npmjs.org/* ]]; then
		unpack "${A}" || die

		# If the ebuild set S to something else, move ${WORKDIR}/package -> ${S}
		if [[ -d ${WORKDIR}/package ]] && [[ ${S} != ${WORKDIR}/package ]]; then
			rm -rf "${S}" || die
			mv "${WORKDIR}/package" "${S}" || die
		fi
	else
		default
	fi
}

_npm_guess_extra_files_from_pkgjson() {
	# Outputs a space-separated list of top-level paths to install (excluding package.json),
	# derived from package.json "files" globs. Approximates npm-packlist behavior.
	python - <<'PY' || return 1
import json, os, glob, sys

S = os.environ["S"]
fallback = os.environ.get("NPM_POPULATE_FALLBACK", "dist")

pkg = os.path.join(S, "package.json")
with open(pkg, "r", encoding="utf-8") as f:
    data = json.load(f)

patterns = data.get("files")
paths = set()

def add(p):
    rel = os.path.relpath(p, S).replace("\\", "/")
    if rel and rel != "." and rel != "package.json":
        paths.add(rel)

if isinstance(patterns, list) and patterns:
    for pat in patterns:
        if not isinstance(pat, str) or not pat.strip():
            continue
        for m in glob.glob(os.path.join(S, pat), recursive=True):
            add(m)
else:
    fb = os.path.join(S, fallback)
    if os.path.exists(fb):
        add(fb)

# Collapse to top-level dirs/files
top = set()
for rel in paths:
    top.add(rel.split("/", 1)[0])

# Drop obvious noise if present
top.discard("")
top.discard(".")

# Output space-separated
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
		else
			# last resort fallback (only if exists)
			[[ -d ${S}/${NPM_POPULATE_FALLBACK} ]] && NPM_EXTRA_FILES="${NPM_POPULATE_FALLBACK}"
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

	# Common docs
	for f in README* HISTORY* ChangeLog AUTHORS NEWS TODO CHANGES \
			THANKS BUGS FAQ CREDITS CHANGELOG* LICENSE* COPYING*; do
		[[ -s "${S}/${f}" ]] && dodoc "${S}/${f}"
	done

	# Optional extra docs
	if in_iuse doc && use doc; then
		for f in ${NPM_DOCS}; do
			[[ -e "${S}/${f}" ]] || continue
			dodoc -r "${S}/${f}" || die "Failed to install docs: ${f}"
		done
	fi

	# Optional bins from ${S}/bin
	if [[ -n "${NPM_BIN}" ]]; then
		for f in ${NPM_BIN}; do
			[[ -f "${S}/bin/${f}" ]] && dobin "${S}/bin/${f}"
		done
	fi
}

EXPORT_FUNCTIONS src_unpack src_prepare src_compile src_install
