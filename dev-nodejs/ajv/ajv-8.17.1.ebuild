# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="ajv"
inherit npm

DESCRIPTION="The fastest JSON validator for Node.js and browser"
HOMEPAGE="https://github.com/ajv-validator/ajv"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/fast-deep-equal
        dev-nodejs/fast-uri
        dev-nodejs/json-schema-traverse
        dev-nodejs/require-from-string
"
