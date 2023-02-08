# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

NEED_EMACS=25

inherit elisp

DESCRIPTION="Emacs major mode for coding in Csound"
HOMEPAGE="https://github.com/hlolli/csound-mode"
SRC_URI="https://github.com/hlolli/csound-mode/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=app-emacs/shut-up-0.3.2
	>=app-emacs/multi-2.0.1
	app-emacs/highlight
"
RDEPEND="${DEPEND}"
BDEPEND=""

SITEFILE="50${PN}-gentoo.el"
