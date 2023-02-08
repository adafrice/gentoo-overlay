# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Man pages for x86 instructions"
HOMEPAGE="https://github.com/ttmo-O/x86-manpages"
SRC_URI="https://github.com/ttmo-O/$PN/archive/refs/tags/v$PV.tar.gz -> $P.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	doman manpages/*
}
