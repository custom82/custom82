# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@cypress/request"
inherit npm

DESCRIPTION="Request is designed to be the simplest way possible to make http calls"
HOMEPAGE="https://github.com/cypress-io/request"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/aws-sign2
        dev-nodejs/aws4
        dev-nodejs/caseless
        dev-nodejs/combined-stream
        dev-nodejs/extend
        dev-nodejs/forever-agent
        dev-nodejs/form-data
        dev-nodejs/http-signature
        dev-nodejs/is-typedarray
        dev-nodejs/isstream
        dev-nodejs/json-stringify-safe
        dev-nodejs/mime-types
        dev-nodejs/performance-now
        dev-nodejs/qs
        dev-nodejs/safe-buffer
        dev-nodejs/tough-cookie
        dev-nodejs/tunnel-agent
        dev-nodejs/uuid
"
