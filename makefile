VERSION=0.5.0
OS=linux
ARCHITECTURE=amd64

all: directories download prepfiles package

directories:
	mkdir -p SOURCE BUILD PACKAGE

download:
	wget -P ./SOURCE -nc -q https://releases.hashicorp.com/vault/${VERSION}/vault_${VERSION}_${OS}_${ARCHITECTURE}.zip 

prepfiles:
	mkdir -p ./BUILD/etc/vault ./BUILD/lib/systemd/system/ ./BUILD/var/lib/vault ./BUILD/usr/local/bin/
	cp ./FILES/server.hcl ./BUILD/etc/vault/
	cp ./FILES/vault.service ./BUILD/lib/systemd/system/
	unzip -o "./SOURCE/vault_${VERSION}_${OS}_${ARCHITECTURE}.zip" -d ./BUILD/usr/local/bin/

package:
	fpm \
	-s dir \
	-t deb \
	-f \
	--log error \
	-n vault \
	--architecture ${ARCHITECTURE} \
	-v ${VERSION} \
	-m 'Christophe Vanlancker <christophe.vanlancker@inuits.eu>' \
	--description 'A tool for managing secrets' \
	--vendor 'HashiCorp' \
	--license 'Mozilla Public License, version 2.0' \
	--url 'https://www.vaultproject.io/' \
	--provides 'vault' \
	--config-files '/etc/vault/server.hcl' \
	--after-install './FILES/after-install' \
	--before-install './FILES/before-install' \
	--after-remove './FILES/after-remove' \
	--before-remove './FILES/before-remove' \
	--after-upgrade './FILES/after-upgrade' \
	-C ./BUILD \
	-p ./PACKAGE

clean:
	rm -fr ./SOURCE ./BUILD ./PACKAGE
