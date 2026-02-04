# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="serialize-error"
inherit npm

DESCRIPTION="Serialize/deserialize an error into a plain object"
HOMEPAGE="https://github.com/sindresorhus/serialize-error"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/non-error
        dev-nodejs/type-fest
"
