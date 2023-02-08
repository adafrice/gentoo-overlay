# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit git-r3 multilib

EGIT_REPO_URI="https://github.com/devurandom/lua-pam.git"

DESCRIPTION="Lua module for PAM authentication"
HOMEPAGE="https://github.com/devurandom/lua-pam"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

IUSE=""

DEPEND="dev-lang/lua"
RDEPEND="${DEPEND}
	virtual/pam"

src_compile() {
	emake LUA_VERSION=
}

src_install() {
	local lua_version="$(best_version dev-lang/lua)"
	local lua_abi="$(get_version_component_range 1-2 ${lua_version##*-})"
	insinto "${PREFIX}/usr/$(get_libdir)/lua/${lua_abi}"
	doins pam.so
}
