# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="anymatch"
inherit npm

DESCRIPTION="Javascript module to match a string against a regular expression, glob, string, or function that takes the string as an argument and returns a truthy or falsy value"
HOMEPAGE="https://github.com/micromatch/anymatch"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/normalize-path
        dev-nodejs/picomatch
"
