# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="paneforge"
inherit npm

DESCRIPTION="PaneForge provides components that make it easy to create resizable panes in your Svelte apps"
HOMEPAGE="https://github.com/svecosystem/paneforge"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/runed
        dev-nodejs/svelte-toolbelt
"
