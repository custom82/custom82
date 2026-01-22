# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for web-apps/openwebui"

ACCT_USER_ID=6666
ACCT_USER_HOME=/var/lib/openwebui
ACCT_USER_GROUPS=( openwebui )

acct-user_add_deps
