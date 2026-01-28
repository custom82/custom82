# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="call-bound"
inherit npm

DESCRIPTION="Robust call-bound JavaScript intrinsics, using call-bind and get-intrinsic"
HOMEPAGE="https://github.com/ljharb/call-bound"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/call-bind-apply-helpers
        dev-nodejs/get-intrinsic

"
