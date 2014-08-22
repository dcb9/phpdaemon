# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


DESCRIPTION="php script daemon"
HOMEPAGE="https://github.com/bobchengbin/phpdaemon"
SRC_URI="http://www.phpor.me/public/packages/phpdaemon-0.1.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="dev-lang/php"
RDEPEND="${DEPEND}"

src_install(){
	dobin phpdaemon
	doinitd phpdaemon_link
	dodoc README.txt
}
