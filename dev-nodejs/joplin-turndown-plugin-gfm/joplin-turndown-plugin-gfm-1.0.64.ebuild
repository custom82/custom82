# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@joplin/turndown-plugin-gfm"
inherit npm

DESCRIPTION="A Turndown plugin which adds GitHub Flavored Markdown extensions"
HOMEPAGE="https://github.com/laurent22/joplin-turndown-plugin-gfm"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

NPM_EXTRA_FILES="lib"

