# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="fs-merger"
inherit npm

DESCRIPTION="This library helps to mask the underlying folder structure and simluates that all the files are stored under a single folder"
HOMEPAGE="https://github.com/SparshithNR/fs-merger"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/broccoli-node-api
        dev-nodejs/broccoli-node-info
        dev-nodejs/fs-extra
        dev-nodejs/fs-tree-diff
        dev-nodejs/walk-sync
"
