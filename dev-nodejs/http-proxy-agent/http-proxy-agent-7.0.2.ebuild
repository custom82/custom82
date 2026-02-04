# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="http-proxy-agent"
inherit npm

DESCRIPTION="This module provides an http.Agent implementation that connects to a specified HTTP or HTTPS proxy server"
HOMEPAGE="https://github.com/jsdom/html-encoding-sniffer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/agent-base
        dev-nodejs/debug
"
