# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Minimal npm helper eclass:
# - installs a Node module payload into /usr/$(get_libdir)/node_modules/<module>
# - optionally installs docs + bins
#
# IMPORTANT: This eclass does NOT run "npm install" or "npm pack".
# The ebuild should do build steps (npm install / npm run build) in src_prepare/src_compile.

inherit multilib

# === User-tunable variables (set in ebuild) ===
# NPM_MODULE: module install name (default: ${PN})
# NPM_FILES: space-separated list of files/dirs to install (default: package.json)
# NPM_EXTRA_FILES: additional files/dirs to install (default: empty)
# NPM_DOCS: space-separated list of doc dirs/files to install when USE=doc is enabled (default: empty)
# NPM_BIN: space-separated list of bin names under ${S}/bin/ to install into /usr/bin (default: empty)
#
# NOTE: If you want doc support, the ebuild should set IUSE="doc" (optional).

: "${NPM_MODULE:=${PN}}"
: "${NPM_FILES:=package.json}"
: "${NPM_EXTRA_FILES:=}"
: "${NPM_DOCS:=}"
: "${NPM_BIN:=}"

npm_src_unpack() {
	# Default unpack is fine for .tgz/.tar.gz sources.
	# If you need custom behavior, override in ebuild.
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

	# Optional extra docs
	if use doc; then
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
