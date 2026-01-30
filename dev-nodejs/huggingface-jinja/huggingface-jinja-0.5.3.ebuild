# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@huggingface/jinja"
inherit npm

DESCRIPTION="A minimalistic JavaScript implementation of the Jinja templating engine, specifically designed for parsing and rendering ML chat templates"
HOMEPAGE="https://github.com/huggingface/huggingface.js/tree/main/packages/jinja"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
        dev-nodejs/huggingface-hub
        dev-nodejs/huggingface-transformers
        dev-nodejs/typescript
"
