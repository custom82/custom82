# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="js-yaml"
inherit npm

DESCRIPTION="This is an implementation of YAML"
HOMEPAGE="https://github.com/nodeca/js-yaml"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/argparse
"
