# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="asn1"
inherit npm

DESCRIPTION="node-asn1 is a library for encoding and decoding ASN.1 datatypes in pure JS"
HOMEPAGE="https://github.com/joyent/node-asn1"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/safer-buffer
"
