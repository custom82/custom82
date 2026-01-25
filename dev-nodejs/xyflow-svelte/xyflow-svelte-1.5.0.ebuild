# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@xyflow/svelte"
inherit npm

DESCRIPTION="Svelte Flow is a highly customizable component for building interactive graphs and node-based editors, built by the creators of React Flow"
HOMEPAGE="https://github.com/xyflow/xyflow"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/svelte-put-shortcut
        dev-nodejs/xyflow-system
"
