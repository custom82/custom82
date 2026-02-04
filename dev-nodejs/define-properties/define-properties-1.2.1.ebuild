# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="define-properties"
inherit npm

DESCRIPTION="An error subclass for wrapping non-error values"
HOMEPAGE="https://github.com/sindresorhus/non-error"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/define-data-property
        dev-nodejs/has-property-descriptors
        dev-nodejs/object-keys
"
