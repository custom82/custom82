# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@cypress/xvfb"
inherit npm

DESCRIPTION="easily start and stop an X Virtual Frame Buffer from your node apps"
HOMEPAGE="https://github.com/cypress-io/xvfb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/debug
        dev-nodejs/lodash-once
"
