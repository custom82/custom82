# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="kokoro-js"
inherit npm

DESCRIPTION="Kokoro is a frontier TTS model for its size of 82 million parameters"
HOMEPAGE="https://github.com/tj/commander.js"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/phonemizer
        dev-nodejs/huggingface-transformers
"
