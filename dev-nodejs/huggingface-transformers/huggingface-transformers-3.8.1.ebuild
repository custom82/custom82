# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@huggingface/transformers"
inherit npm

DESCRIPTION="State-of-the-art Machine Learning for the Web"
HOMEPAGE="https://github.com/huggingface/transformers.js"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/huggingface-jinja
        dev-nodejs/onnxruntime-node
        dev-nodejs/onnxruntime-web
        dev-nodejs/sharp
"
