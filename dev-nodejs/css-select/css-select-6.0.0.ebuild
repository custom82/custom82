# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="css-select"
inherit npm

DESCRIPTION="A CSS selector compiler and engine"
HOMEPAGE="https://github.com/fb55/css-select"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/boolbase
        dev-nodejs/css-what
        dev-nodejs/domhandler
        dev-nodejs/domutils
        dev-nodejs/nth-check
"
