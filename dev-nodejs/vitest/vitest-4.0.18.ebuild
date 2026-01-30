# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vitest"
inherit npm

DESCRIPTION="Next generation testing framework powered by Vite"
HOMEPAGE="https://github.com/vitest-dev/vitest"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vitest-expect
        dev-nodejs/vitest-mocker
        dev-nodejs/vitest-pretty-format
        dev-nodejs/vitest-runner
        dev-nodejs/vitest-snapshot
        dev-nodejs/vitest-spy
        dev-nodejs/vitest-utils
        dev-nodejs/es-module-lexer
        dev-nodejs/expect-type
        dev-nodejs/magic-string
        dev-nodejs/obug
        dev-nodejs/pathe
        dev-nodejs/picomatch
        dev-nodejs/std-env
        dev-nodejs/tinybench
        dev-nodejs/tinyexec
        dev-nodejs/tinyglobby
        dev-nodejs/tinyrainbow
        dev-nodejs/vite
        dev-nodejs/why-is-node-running
"
