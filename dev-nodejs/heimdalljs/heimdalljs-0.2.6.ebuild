# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="heimdalljs"
inherit npm

DESCRIPTION="Heimdall tracks a graph of timing and domain-specific stats for performance"
HOMEPAGE="https://github.com/heimdalljs/heimdalljs-lib"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/rsvp
"
