# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="enquirer"
inherit npm

DESCRIPTION="Stylish CLI prompts that are user-friendly, intuitive and easy to create"
HOMEPAGE="https://github.com/enquirer/enquirer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/ansi-colors
        dev-nodejs/strip-ansi
"
