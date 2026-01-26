# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="abort-controller"
inherit npm

DESCRIPTION="An implementation of WHATWG AbortController interface"
HOMEPAGE="https://github.com/mysticatea/abort-controller"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/event-target-shim
"
