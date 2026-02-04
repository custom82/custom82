# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="global-agent"
inherit npm

DESCRIPTION="Global HTTP/HTTPS proxy configurable using environment variables"
HOMEPAGE="https://github.com/gajus/global-agent"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/es6-error
        dev-nodejs/globalthis
        dev-nodejs/matcher
        dev-nodejs/omit-undefined
        dev-nodejs/semver
        dev-nodejs/serialize-error
"
