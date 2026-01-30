# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="rxjs"
inherit npm

DESCRIPTION="RxJS: Reactive Extensions For JavaScript"
HOMEPAGE="https://github.com/reactivex/rxjs"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/tslib
"
