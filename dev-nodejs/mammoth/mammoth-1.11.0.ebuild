# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="mammoth"
inherit npm

DESCRIPTION="Mammoth is designed to convert .docx documents, such as those created by Microsoft Word, Google Docs and LibreOffice, and convert them to HTML"
HOMEPAGE="https://github.com/mwilliamson/mammoth.js"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/xmldom-xmldom
        dev-nodejs/argparse
        dev-nodejs/base64-js
        dev-nodejs/bluebird
        dev-nodejs/dingbat-to-unicode
        dev-nodejs/jszip
        dev-nodejs/lop
        dev-nodejs/path-is-absolute
        dev-nodejs/underscore
        dev-nodejs/xmlbuilder
"
