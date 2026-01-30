# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@pyscript/core"
inherit npm

DESCRIPTION="PyScript brings two Python interpreters to the browser:"
HOMEPAGE="https://github.com/pyscript/pyscript"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/ungap-with-resolvers
        dev-nodejs/webreflection-idb-map
        dev-nodejs/webreflection-utils
        dev-nodejs/add-promise-listener
        dev-nodejs/basic-devtools
        dev-nodejs/polyscript
        dev-nodejs/sticky-module
        dev-nodejs/to-json-callback
        dev-nodejs/type-checked-collections
"


