# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

COMMIT="d48439773b30f50e4632a446d6d277c4962a641b"

DESCRIPTION="A minimalistic JavaScript implementation of the Jinja templating engine, specifically designed for parsing and rendering ML chat templates"
HOMEPAGE="https://github.com/huggingface/huggingface.js/tree/main/packages/jinja"
SRC_URI="https://github.com/huggingface/huggingface.js/archive/$COMMIT.tar.gz -> ${P}.tar.gz"



LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
        dev-nodejs/huggingface-hub
        dev-nodejs/huggingface-transformers
        dev-nodejs/typescript
"


NPM_MODULE="@huggingface/jinja"
NPM_EXTRA_FILES="vitest.config.ts vite.config.js tsconfig.json pnpm-lock.yaml src"

npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/huggingface.js-${COMMIT}/packages/jinja ${S}
    rm -r ${WORKDIR}/huggingface.js-${COMMIT}

}
