# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="sync-child-process"
inherit npm

DESCRIPTION="This package exposes a SyncChildProcess class that allows Node.js to run a subprocess synchronously and interactively"
HOMEPAGE="https://github.com/sass/sync-child-process"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/sync-message-port
"
