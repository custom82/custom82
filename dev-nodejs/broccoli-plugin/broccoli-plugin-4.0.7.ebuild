# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="broccoli-plugin"
inherit npm

DESCRIPTION="The Broccoli Plugin Base Class"
HOMEPAGE="https://github.com/broccolijs/broccoli-plugin"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/broccoli-node-api
        dev-nodejs/broccoli-output-wrapper
        dev-nodejs/fs-merger
        dev-nodejs/promise-map-series
        dev-nodejs/quick-temp
        dev-nodejs/rimraf
        dev-nodejs/symlink-or-copy
"
