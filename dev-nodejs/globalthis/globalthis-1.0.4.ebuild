# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="globalthis"
inherit npm

DESCRIPTION="An ECMAScript spec-compliant polyfill/shim for globalThis. Invoke its "shim" method to shim globalThis if it is unavailable"
HOMEPAGE="https://github.com/ljharb/System.global"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/define-properties
        dev-nodejs/gopd
"
