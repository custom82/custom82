# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="ecc-jsbn"
inherit npm

DESCRIPTION="ECC package based on jsbn from Tom Wu"
HOMEPAGE="https://github.com/quartzjer/ecc-jsbn"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/jsbn
"
