# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="mermaid"
inherit npm

DESCRIPTION="Generate diagrams from markdown-like text"
HOMEPAGE="https://github.com/mermaid-js/mermaid"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/braintree-sanitize-url
        dev-nodejs/iconify-utils
        dev-nodejs/mermaid-js-parser
        dev-nodejs/types-d3
        dev-nodejs/cytoscape
        dev-nodejs/cytoscape-cose-bilkent
        dev-nodejs/cytoscape-fcose
        dev-nodejs/d3
        dev-nodejs/d3-sankey
        dev-nodejs/dagre-d3-es
        dev-nodejs/dayjs
        dev-nodejs/dompurify
        dev-nodejs/katex
        dev-nodejs/khroma
        dev-nodejs/lodash-es
        dev-nodejs/marked
        dev-nodejs/roughjs
        dev-nodejs/stylis
        dev-nodejs/ts-dedent
        dev-nodejs/uuid
"
