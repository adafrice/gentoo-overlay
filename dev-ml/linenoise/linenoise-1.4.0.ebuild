# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit dune

DESCRIPTION="Self-contained OCaml bindings to linenoise"
HOMEPAGE="https://github.com/ocaml-community/ocaml-linenoise"
SRC_URI="https://github.com/ocaml-community/ocaml-linenoise/archive/${PV}.tar.gz -> ocaml-${P}.tar.gz"
S="${WORKDIR}"/ocaml-${P}

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+ocamlopt test"
RESTRICT="!test? ( test )"

DEPEND="dev-ml/result"
RDEPEND="${DEPEND}"
BDEPEND=""
