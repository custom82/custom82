# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="bcrypt-pbkdf"
inherit npm

DESCRIPTION="Port of the OpenBSD bcrypt_pbkdf function to pure Javascript"
HOMEPAGE="https://github.com/joyent/node-bcrypt-pbkdf"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/tweetnacl
"
