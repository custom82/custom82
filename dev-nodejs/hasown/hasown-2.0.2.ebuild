# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="hasown"
inherit npm

DESCRIPTION="A robust, ES3 compatible, has own property predicate"
HOMEPAGE="https://github.com/inspect-js/hasOwn"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/function-bind
"
