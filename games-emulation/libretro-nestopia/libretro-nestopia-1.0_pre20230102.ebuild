# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/nestopia"
LIBRETRO_COMMIT_SHA="63a4a991d3daf7a0beb0eee203816a72637437a1"
inherit libretro-core

DESCRIPTION="Libretro implementation of Nestopia. (Nintendo Entertainment System)"
HOMEPAGE="https://github.com/libretro/nestopia"
KEYWORDS="~amd64 ~x86"

LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}
		games-emulation/libretro-core-info
		!games-emulation/nestopia-libretro"

S="${S}//libretro"

