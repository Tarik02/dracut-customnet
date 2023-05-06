# Maintainer: Tarik02 <Taras.Fomin at gmail dot com>
pkgname=dracut-customnet
pkgver=1
pkgrel=1
pkgdesc="Dracut custom network"
arch=(any)
url="https://github.com/Tarik02/dracut-customnet"
license=(GPL3)
groups=()
depends=(dracut)
makedepends=()

package() {
	cd "$startdir"

	target="$pkgdir/usr/lib/dracut/modules.d/99customnet"
	install -Dt "$target" -m 0755 module-setup.sh
	install -Dt "$target" -m 0644 customnet.service
	install -Dt "$target" -m 0644 customnet-wpa.service
	install -Dt "$pkgdir/etc/customnet" -m 0644 customnet
}
