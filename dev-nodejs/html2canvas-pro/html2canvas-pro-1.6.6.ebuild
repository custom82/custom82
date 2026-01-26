# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="html2canvas-pro"
inherit npm

DESCRIPTION="html2canvas-pro is a fork of niklasvh/html2canvas that includes various fixes and new features"
HOMEPAGE="https://github.com/yorickshan/html2canvas-pro"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/css-line-break
        dev-nodejs/text-segmentation
"
