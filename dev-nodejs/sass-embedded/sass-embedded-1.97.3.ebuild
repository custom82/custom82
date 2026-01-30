# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="sass-embedded"
inherit npm

DESCRIPTION="Embedded Sass Host"
HOMEPAGE="https://github.com/sass/embedded-host-node"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/bufbuild-protobuf
        dev-nodejs/colorjs-io
        dev-nodejs/immutable
        dev-nodejs/rxjs
        dev-nodejs/supports-color
        dev-nodejs/sync-child-process
        dev-nodejs/varint
"
