# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cypress"
inherit npm

DESCRIPTION="Fast, easy and reliable testing for anything that runs in a browser"
HOMEPAGE="https://github.com/cypress-io/cypress"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/cypress-request
        dev-nodejs/cypress-xvfb
        dev-nodejs/types/sinonjs-fake-timers
        dev-nodejs/types-sizzle
        dev-nodejs/types-tmp
        dev-nodejs/arch
        dev-nodejs/blob-util
        dev-nodejs/bluebird
        dev-nodejs/buffer
        dev-nodejs/cachedir
        dev-nodejs/chalk
        dev-nodejs/ci-info
        dev-nodejs/cli-cursor
        dev-nodejs/cli-table3
        dev-nodejs/commander
        dev-nodejs/common-tags
        dev-nodejs/dayjs
        dev-nodejs/debug
        dev-nodejs/enquirer
        dev-nodejs/eventemitter2
        dev-nodejs/execa
        dev-nodejs/executable
        dev-nodejs/extract-zip
        dev-nodejs/figures
        dev-nodejs/fs-extra
        dev-nodejs/hasha
        dev-nodejs/is-installed-globally
        dev-nodejs/listr2
        dev-nodejs/lodash
        dev-nodejs/log-symbols
        dev-nodejs/minimist
        dev-nodejs/ospath
        dev-nodejs/pretty-bytes
        dev-nodejs/process
        dev-nodejs/proxy-from-env
        dev-nodejs/request-progress
        dev-nodejs/supports-color
        dev-nodejs/systeminformation
        dev-nodejs/tmp
        dev-nodejs/tree-kill
        dev-nodejs/untildify
        dev-nodejs/yauzl
"
