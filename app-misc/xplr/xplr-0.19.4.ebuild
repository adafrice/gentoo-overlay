# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LUA_COMPAT=( luajit )

CRATES="
	aho-corasick-0.7.19
	android_system_properties-0.1.5
	anes-0.1.6
	ansi-to-tui-2.0.0
	anyhow-1.0.65
	assert_cmd-2.0.4
	atty-0.2.14
	autocfg-1.1.0
	bitflags-1.3.2
	bstr-0.2.17
	bumpalo-3.11.0
	cassowary-0.3.0
	cast-0.3.0
	cc-1.0.73
	cfg-if-1.0.0
	chrono-0.4.22
	ciborium-0.2.0
	ciborium-io-0.2.0
	ciborium-ll-0.2.0
	clap-3.2.22
	clap_lex-0.2.4
	core-foundation-sys-0.8.3
	criterion-0.4.0
	criterion-plot-0.5.0
	crossbeam-channel-0.5.6
	crossbeam-deque-0.8.2
	crossbeam-epoch-0.9.11
	crossbeam-utils-0.8.12
	crossterm-0.25.0
	crossterm_winapi-0.9.0
	difflib-0.4.0
	dirs-4.0.0
	dirs-sys-0.3.7
	doc-comment-0.3.3
	either-1.8.0
	erased-serde-0.3.23
	fuzzy-matcher-0.3.7
	gethostname-0.2.3
	getrandom-0.2.7
	half-1.8.2
	hashbrown-0.12.3
	hermit-abi-0.1.19
	humansize-2.1.0
	iana-time-zone-0.1.50
	indexmap-1.9.1
	itertools-0.10.5
	itoa-1.0.3
	js-sys-0.3.60
	lazy_static-1.4.0
	libc-0.2.134
	libm-0.2.5
	linked-hash-map-0.5.6
	lock_api-0.4.9
	log-0.4.17
	lua-src-544.0.1
	luajit-src-210.4.3+resty8384278
	memchr-2.5.0
	memoffset-0.6.5
	mime-0.3.16
	mime_guess-2.0.4
	minimal-lexical-0.2.1
	mio-0.8.4
	mlua-0.8.3
	natord-1.0.9
	nom-7.1.1
	num-integer-0.1.45
	num-traits-0.2.15
	num_cpus-1.13.1
	once_cell-1.15.0
	oorandom-11.1.3
	os_str_bytes-6.3.0
	parking_lot-0.12.1
	parking_lot_core-0.9.3
	pkg-config-0.3.25
	plotters-0.3.4
	plotters-backend-0.3.4
	plotters-svg-0.3.3
	predicates-2.1.1
	predicates-core-1.0.3
	predicates-tree-1.0.5
	proc-macro2-1.0.46
	quote-1.0.21
	rayon-1.5.3
	rayon-core-1.9.3
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-1.6.0
	regex-automata-0.1.10
	regex-syntax-0.6.27
	rustc-hash-1.1.0
	ryu-1.0.11
	same-file-1.0.6
	scopeguard-1.1.0
	serde-1.0.145
	serde_derive-1.0.145
	serde_json-1.0.85
	serde_yaml-0.8.26
	signal-hook-0.3.14
	signal-hook-mio-0.2.3
	signal-hook-registry-1.4.0
	smallvec-1.10.0
	syn-1.0.101
	termtree-0.2.4
	textwrap-0.15.1
	thiserror-1.0.37
	thiserror-impl-1.0.37
	thread_local-1.1.4
	time-0.1.44
	tinytemplate-1.2.1
	tui-0.19.0
	tui-input-0.6.0
	unicase-2.6.0
	unicode-ident-1.0.4
	unicode-segmentation-1.10.0
	unicode-width-0.1.10
	version_check-0.9.4
	wait-timeout-0.2.0
	walkdir-2.3.2
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.83
	wasm-bindgen-backend-0.2.83
	wasm-bindgen-macro-0.2.83
	wasm-bindgen-macro-support-0.2.83
	wasm-bindgen-shared-0.2.83
	web-sys-0.3.60
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.36.1
	windows_aarch64_msvc-0.36.1
	windows_i686_gnu-0.36.1
	windows_i686_msvc-0.36.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_msvc-0.36.1
	yaml-rust-0.4.5
"

inherit cargo lua-single

DESCRIPTION="A hackable, minimal, fast TUI file explorer"
HOMEPAGE="https://github.com/sayanarijit/xplr"
SRC_URI="
	https://github.com/sayanarijit/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="
	|| ( Apache-2.0 )
	|| ( BSD )
	|| ( MIT )
	|| ( Unlicense )
	Apache-2.0
	BSD
	MIT
	Unlicense
"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

REQUIRED_USE="${LUA_REQUIRED_USE}"
RDEPEND="
	${LUA_DEPS}
"
DEPEND="
	${RDEPEND}
"

QA_FLAGS_IGNORED="usr/bin/.*"

src_configure() {
	cargo_src_configure --bin xplr
}

src_prepare() {
	sed -i Cargo.toml -e 's/"vendored"\s*,//' || die
	# for dynamic linking with lua
	default
}

src_compile() {
	# cargo_src_compile
	cargo build --locked --release
}

src_install() {
	if use doc; then
		dodoc README.md
		dodc -r docs/*
		einstalldocs
	fi
	dobin target/release/xplr
}
