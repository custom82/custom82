# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="fastq"
inherit npm

DESCRIPTION="Fast, in memory work queue."
HOMEPAGE="https://github.com/mcollina/fastq"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/reusify
"
