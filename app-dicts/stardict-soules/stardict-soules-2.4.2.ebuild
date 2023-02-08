# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

_PN="stardict-Soule_s_Dictionary_of_English_Synonyms"

inherit stardict

HOMEPAGE="http://download.huzheng.org/bigdict/"
SRC_URI="http://download.huzheng.org/bigdict/${_PN}-${PV}.tar.bz2"
DESCRIPTION="Stardict Dictionary for Webster's Revised Unabridged Dictionary (1913)"

S="${WORKDIR}/${_PN}-${PV}"


KEYWORDS="~amd64"

