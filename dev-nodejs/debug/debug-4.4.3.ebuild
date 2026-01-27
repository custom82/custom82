# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="debug"
inherit npm

DESCRIPTION="A tiny JavaScript debugging utility modelled after Node.js core's debugging technique"
HOMEPAGE="https://www.npmjs.com/package/debug"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/ms
"
