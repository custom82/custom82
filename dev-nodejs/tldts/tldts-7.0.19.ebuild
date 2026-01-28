# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="tldts"
inherit npm

DESCRIPTION="tldts is a JavaScript library to extract hostnames, domains, public suffixes, top-level domains and subdomains from URLs"
HOMEPAGE="https://github.com/remusao/tldts"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/tldts-core
"
