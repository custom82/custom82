# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="svelte-sonner"
inherit npm

DESCRIPTION="An opinionated toast component for Svelte. A port of Emil Kowalski's Sonner"
HOMEPAGE="https://github.com/wobsoriano/svelte-sonner"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/runed
"
