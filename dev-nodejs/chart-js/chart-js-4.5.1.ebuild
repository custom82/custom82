# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="chart.js"
inherit npm

DESCRIPTION="Simple yet flexible JavaScript charting for designers & developers"
HOMEPAGE="https://github.com/chartjs/Chart.js"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/kurkle-color
"
