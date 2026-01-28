# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="call-bind-apply-helpers"
inherit npm

DESCRIPTION="Helper functions around Function call/apply/bind, for use in call-bind"
HOMEPAGE="https://github.com/ljharb/call-bind-apply-helpers"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/es-errors
        dev-nodejs/function-bind
"
