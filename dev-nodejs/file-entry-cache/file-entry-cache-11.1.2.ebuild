# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="file-entry-cache"
inherit npm

DESCRIPTION="A lightweight cache for file metadata, ideal for processes that work on a specific set of files and only need to reprocess files that have changed since the last run"
HOMEPAGE="https://github.com/jaredwray/cacheable"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/flat-cache
"
