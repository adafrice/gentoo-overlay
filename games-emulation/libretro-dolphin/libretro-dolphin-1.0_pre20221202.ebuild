# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/dolphin"
LIBRETRO_COMMIT_SHA="44394cee28d44c70debdb176ad2f2f5e38e9f04c"
LIBRETRO_CORE_NAME="dolphin"

inherit libretro-core cmake

DESCRIPTION="A Gamecube/Wii emulator core for libretro"
HOMEPAGE="https://github.com/libretro/dolphin"
KEYWORDS="~amd64 ~arm64"
IUSE="+opengl vulkan +X lto"

LICENSE="GPL-2"
SLOT="0"

# In the original ebuild, might not actually need it
RDEPEND="
	dev-libs/hidapi=
	dev-libs/libfmt=
	dev-libs/lzo=
	dev-libs/pugixml
	dev-qt/qtconcurrent
	media-libs/libpng
	media-libs/libsfml
	media-libs/mesa
	net-libs/enet
	net-libs/mbedtls
	net-misc/curl
	sys-libs/readline
	sys-libs/zlib
	x? (
		x11-libs/libXext
		x11-libs/libXi
		x11-libs/libXrandr
	)
	opengl? ( virtual/opengl )
	vulkan? ( media-libs/vulkan-loader )
	virtual/libusb
"
RDEPEND="${DEPEND}
	games-emulation/libretro-core-info
	!games-emulation/dolphin-libretro"

src_prepare() {
	libretro-core_src_prepare
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DCCACHE_BIN=CCACHE_BIN-NOTFOUND
		-DENABLE_LTO=$(usex lto ON OFF)
		#-DENABLE_LLVM=OFF
		-DBUILD_SHARED_LIBS=OFF
		-DLIBRETRO=ON
		-DLIBRETRO_STATIC=1
		-DENABLE_QT=OFF
		-DUSE_SHARED_ENET=ON
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_INSTALL_PREFIX=/usr
		-DENABLE_X11=$(usex X)
	)
	cmake_src_configure
}

src_install() {
	LIBRETRO_LIB_DIR="${EROOT%/}/usr/$(get_libdir)/libretro"
	insinto "${LIBRETRO_LIB_DIR}"
	doins "${WORKDIR}/${PF}_build/${LIBRETRO_CORE_NAME}_libretro.so"
}
