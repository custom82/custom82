# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="request-progress"
inherit npm

DESCRIPTION="Tracks the download progress of a request made with request, giving insight of various metrics including progress percentage"
HOMEPAGE="https://github.com/IndigoUnited/node-request-progress"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/throttleit
"
