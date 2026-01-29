# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="i18next-parser"
inherit npm

DESCRIPTION="When translating an application, maintaining the translation catalog by hand is painful. This package parses your code and automates this process"
HOMEPAGE="https://github.com/i18next/i18next-parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/babel-runtime
        dev-nodejs/broccoli-plugin
        dev-nodejs/cheerio
        dev-nodejs/colors
        dev-nodejs/commander
        dev-nodejs/eol
        dev-nodejs/esbuild
        dev-nodejs/fs-extra
        dev-nodejs/gulp-sort
        dev-nodejs/i18next
        dev-nodejs/js-yaml
        dev-nodejs/lilconfig
        dev-nodejs/rsvp
        dev-nodejs/sort-keys
        dev-nodejs/typescript
        dev-nodejs/vinyl
        dev-nodejs/vinyl-fs
"
