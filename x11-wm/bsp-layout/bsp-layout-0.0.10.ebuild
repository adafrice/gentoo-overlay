# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Manage layouts with bspwm"
HOMEPAGE="https://github.com/phenax/bsp-layout"
SRC_URI="https://github.com/phenax/bsp-layout/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=(
"${FILESDIR}"/${PN}-${PV}-fix-make.patch
)

DEPEND="
	x11-wm/bspwm
	sys-devel/bc
	app-shells/bash
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() { :; }

src_install() {
	echo ${D}
	emake DESTDIR="${D}" PREFIX=/usr install
}
