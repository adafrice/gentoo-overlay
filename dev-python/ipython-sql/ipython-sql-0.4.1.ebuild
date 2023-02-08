# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_10 )
inherit distutils-r1

DESCRIPTION="RDBMS access via IPython"
HOMEPAGE="
	https://github.com/catherinedevlin/ipython-sql
	https://pypi.org/project/ipython-sql
"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="postgres test pandas"

RDEPEND="
	dev-python/ipython[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-0.6.7[${PYTHON_USEDEP}]
	dev-python/prettytable[${PYTHON_USEDEP}]
	dev-python/sqlparse[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	postgres? (
		dev-python/psycopg:2[${PYTHON_USEDEP}]
	)
	pandas? (
		dev-python/pandas[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
