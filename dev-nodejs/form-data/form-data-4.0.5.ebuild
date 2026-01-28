# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="form-data"
inherit npm

DESCRIPTION="HTTP Agent that keeps socket connections alive between keep-alive requests"
HOMEPAGE="https://github.com/form-data/form-data"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/asynckit
        dev-nodejs/combined-stream
        dev-nodejs/es-set-tostringtag
        dev-nodejs/hasown
        dev-nodejs/mime-types
"
