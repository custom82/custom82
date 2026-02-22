# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="lie"
inherit npm

DESCRIPTION="lie is a small, performant promise library implementing the Promises/A+ spec"
HOMEPAGE="https://github.com/calvinmetcalf/lie"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/immediate
"
