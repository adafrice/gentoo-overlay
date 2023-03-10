# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/citra"
LIBRETRO_COMMIT_SHA="5d1b3063383c0df46d286a108939bf5441549a29"
SOUNDTOUCH_COMMIT_SHA="060181eaf273180d3a7e87349895bd0cb6ccbf4a"
DYNARMIC_COMMIT_SHA="af0d4a7c18ee90d544866a8cf24e6a0d48d3edc4"

inherit cmake libretro-core toolchain-funcs

DESCRIPTION="Nintendo 3DS for libretro"
SRC_URI="
	https://github.com/${LIBRETRO_REPO_NAME}/archive/${LIBRETRO_COMMIT_SHA}.tar.gz -> ${P}.tar.gz
	https://github.com/citra-emu/ext-soundtouch/archive/${SOUNDTOUCH_COMMIT_SHA}.tar.gz -> ${P}-soundtouch.tar.gz
	https://github.com/citra-emu/dynarmic/archive/${DYNARMIC_COMMIT_SHA}.tar.gz -> ${P}-dynarmic.tar.gz
"
HOMEPAGE="https://github.com/libretro/citra"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-libs/crypto++
	dev-libs/libfmt
	net-libs/enet:1.3=
"
	# dev-libs/dynarmic
DEPEND="${RDEPEND}
	dev-cpp/catch:0
	dev-libs/xbyak
	dev-util/nihstro
"

PATCHES=(
	"${FILESDIR}/0001-externals-reduce-bundled-dependencies.patch"
)

src_unpack() {
	default

	mv "${WORKDIR}/ext-soundtouch-${SOUNDTOUCH_COMMIT_SHA}"/* \
		"${S}/externals/soundtouch/"
	mv "${WORKDIR}/dynarmic-${DYNARMIC_COMMIT_SHA}"/* \
		"${S}/externals/dynarmic/"
}

S=${WORKDIR}/citra-${LIBRETRO_COMMIT_SHA}

src_prepare() {
	cmake_src_prepare
	sed -i '/check_submodules_present()/d' CMakeLists.txt || die
}

src_configure() {
	local mycmakeargs=(
		# -DDISABLE_BUNDLED_DEPENDENCIES=ON
		-DENABLE_LIBRETRO=ON
		-DENABLE_QT=OFF
		-DENABLE_SDL2=OFF
		-DENABLE_WEB_SERVICE=OFF
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${BUILD_DIR}/src/citra_libretro/${LIBRETRO_CORE_NAME}_libretro.so" \
	libretro-core_src_install
}
