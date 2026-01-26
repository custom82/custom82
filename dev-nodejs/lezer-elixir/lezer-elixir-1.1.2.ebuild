# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="lezer-elixir"
inherit npm

DESCRIPTION="Elixir grammar for the Lezer parser system"
HOMEPAGE="https://github.com/livebook-dev/lezer-elixir"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/lezer-highlight
        dev-nodejs/lezer-lr
"
