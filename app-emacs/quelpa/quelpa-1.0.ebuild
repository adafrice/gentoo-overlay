# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

NEED_EMACS=25.1

inherit elisp

DESCRIPTION="Build and install your Emacs Lisp packages on-the-fly directly from source"
HOMEPAGE="https://github.com/quelpa/quelpa"
SRC_URI="https://github.com/quelpa/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-vcs/git-2.20
	app-arch/tar
"
RDEPEND="${DEPEND}"
BDEPEND=""


SITEFILE="50${PN}-gentoo.el"
