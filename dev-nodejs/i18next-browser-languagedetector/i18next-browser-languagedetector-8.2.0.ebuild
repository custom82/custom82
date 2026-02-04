# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="i18next-browser-languagedetector"
inherit npm

DESCRIPTION="This is an i18next language detection plugin used to detect user language in the browser"
HOMEPAGE="https://github.com/i18next/i18next-browser-languageDetector"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/babel-runtime
"
