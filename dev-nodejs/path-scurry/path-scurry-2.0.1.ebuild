# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="path-scurry"
inherit npm

DESCRIPTION="Extremely high performant utility for building tools that read the file system"
HOMEPAGE="https://github.com/isaacs/path-scurry"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/lru-cache
        dev-nodejs/minipass
"
