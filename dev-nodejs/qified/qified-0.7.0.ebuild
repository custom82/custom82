# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="qified"
inherit npm

DESCRIPTION="Task and Message Queues with Multiple Providers"
HOMEPAGE="https://github.com/jaredwray/qified"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/hookified
"
