# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="An X11 menu"
HOMEPAGE="https://jgmenu.github.io/"
SRC_URI="https://github.com/johanmalm/jgmenu/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="gtktheme lx pmenu"

DEPEND="
	x11-libs/libX11
	x11-libs/libXrandr
	x11-libs/cairo
	x11-libs/pango
	gnome-base/librsvg
	dev-libs/glib:2
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	econf\
		$(use_with gtktheme) \
		$(use_with lx) \
		$(use_with pmenu)
}

src_compile() {
	emake || die
}

src_install() {
	emake DESTDIR="${D}" install

	dodoc AUTHORS.md README.md

	doman docs/manual/*.1
	doman docs/manual/*.7
}
