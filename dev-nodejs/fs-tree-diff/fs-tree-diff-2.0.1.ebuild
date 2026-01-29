# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="fs-tree-diff"
inherit npm

DESCRIPTION="FSTree provides the means to calculate a patch (set of operations) between one file system tree and another"
HOMEPAGE="https://github.com/stefanpenner/fs-tree-diff"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-symlink-or-copy
        dev-nodejs/heimdalljs-logger
        dev-nodejs/object-assign
        dev-nodejs/path-posix
        dev-nodejs/symlink-or-copy
"
