# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="style-to-object"
inherit npm

DESCRIPTION="Parse CSS inline style to JavaScript object:"
HOMEPAGE="https://github.com/remarkablemark/style-to-object"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/inline-style-parser


"
