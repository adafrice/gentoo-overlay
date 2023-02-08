# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A key remapping daemon for Linux"
HOMEPAGE="https://github.com/rvaiya/keyd"
SRC_URI="https://github.com/rvaiya/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sys-kernel/linux-headers
	dev-python/python-xlib
	acct-group/keyd
"
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=(
	"${FILESDIR}/${P}-groupadd.patch"
)

src_install() {
	emake DESTDIR="${D}" install

	mv ${ED}/usr/share/doc/keyd ${ED}/usr/share/doc/${PF}

	newinitd "${FILESDIR}/keyd.initd" keyd
}
