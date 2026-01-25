# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@tiptap/starter-kit"
inherit npm

DESCRIPTION="Tiptap is a headless wrapper around ProseMirror – a toolkit for building rich text WYSIWYG editors"
HOMEPAGE="https://github.com/ueberdosis/tiptap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/tiptap-core
        dev-nodejs/tiptap-extension-blockquote
        dev-nodejs/tiptap-extension-bold
        dev-nodejs/tiptap-extension-bullet-list
        dev-nodejs/tiptap-extension-code
        dev-nodejs/tiptap-extension-code-block
        dev-nodejs/tiptap-extension-document
        dev-nodejs/tiptap-extension-dropcursor
        dev-nodejs/tiptap-extension-gapcursor
        dev-nodejs/tiptap-extension-hard-break
        dev-nodejs/tiptap-extension-heading
        dev-nodejs/tiptap-extension-horizontal-rule
        dev-nodejs/tiptap-extension-italic
        dev-nodejs/tiptap-extension-link
        dev-nodejs/tiptap-extension-list
        dev-nodejs/tiptap-extension-list-item
        dev-nodejs/tiptap-extension-list-keymap
        dev-nodejs/tiptap-extension-ordered-list
        dev-nodejs/tiptap-extension-paragraph
        dev-nodejs/tiptap-extension-strike
        dev-nodejs/tiptap-extension-text
        dev-nodejs/tiptap-extension-underline
        dev-nodejs/tiptap-extensions
        dev-nodejs/tiptap-pm
"
