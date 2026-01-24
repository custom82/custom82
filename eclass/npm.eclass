# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# npm.eclass (overlay-local)
#
# Goals:
# - Provide sensible defaults for npm-registry tarballs when the ebuild does not set SRC_URI/S.
# - Install a Node module payload into /usr/$(get_libdir)/node_modules/<module>
# - Optionally install docs + bins
#
# IMPORTANT:
# - This eclass does NOT run "npm install" or "npm pack".
#   The ebuild should do build steps (npm install / npm run build) in src_prepare/src_compile
#   when building from source.
# - The SRC_URI default is only suitable for releases published to the npm registry.
#   For GitHub snapshots/live builds, set SRC_URI/EGIT_* in the ebuild.

inherit multilib

# === User-tunable variables (set in ebuild) ===
# NPM_MODULE: npm package name (default: ${PN})
# NPM_FILES: space-separated list of files/dirs to install (default: package.json)
# NPM_EXTRA_FILES: additional files/dirs to install (default: empty)
# NPM_DOCS: space-separated list of doc dirs/files to install when USE=doc is enabled (default: empty)
# NPM_BIN: space-separated list of bin names under ${S}/bin/ to install into /usr/bin (default: empty)
#
# NOTE: If you want doc support, the ebuild can set IUSE="doc". This eclass
# will not error if doc is not in IUSE; it will simply skip doc handling.

: "${NPM_MODULE:=${PN}}"
: "${NPM_FILES:=package.json}"
: "${NPM_EXTRA_FILES:=}"
: "${NPM_DOCS:=}"
: "${NPM_BIN:=}"

# Derived variables:
# - NPM_PN: npm "unscoped" name part (for @scope/name it's "name")
# - NPM_REGISTRY_TARBALL: tarball basename used by npm registry
if [[ ${NPM_MODULE} == */* ]]; then
	NPM_PN=${NPM_MODULE##*/}
else
	NPM_PN=${NPM_MODULE}
fi
: "${NPM_PN:=${NPM_MODULE}}"
: "${NPM_REGISTRY_TARBALL:=${NPM_PN}}"

# Default SRC_URI/S for npm registry tarballs if the ebuild did not set them.
# Unscoped:
#   https://registry.npmjs.org/<name>/-/<name>-<PV>.tgz
# Scoped:
#   https://registry.npmjs.org/@scope/name/-/name-<PV>.tgz
#
# We also rename distfile to ${P}.tgz to keep DISTDIR tidy.
if [[ -z ${SRC_URI} ]]; then
	SRC_URI="https://registry.npmjs.org/${NPM_MODULE}/-/${NPM_REGISTRY_TARBALL}-${PV}.tgz -> ${P}.tgz"
fi

# npm tarballs unpack into ${WORKDIR}/package
if [[ -z ${S} ]]; then
	S="${WORKDIR}/package"
fi

npm_src_unpack() {
	# Default unpack is fine for .tgz/.tar.gz sources.
	default
}

npm_src_prepare() {
	default
}

npm_src_compile() {
	# Most JS/TS libs don't compile by default; ebuild can override.
	:
}

npm_src_install() {
	local node_modules_dir="${ED}/usr/$(get_libdir)/node_modules/${NPM_MODULE}"
	local npm_files="${NPM_FILES} ${NPM_EXTRA_FILES}"

	# Ensure target directory exists
	mkdir -p "${node_modules_dir}" || die "Could not create ${node_modules_dir}"

	# Install module payload
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

	# Common docs found in npm packages
	for f in README* HISTORY* ChangeLog AUTHORS NEWS TODO CHANGES \
			THANKS BUGS FAQ CREDITS CHANGELOG*; do
		[[ -s "${S}/${f}" ]] && dodoc "${S}/${f}"
	done

	# Optional extra docs (only if doc is declared in IUSE and enabled)
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
