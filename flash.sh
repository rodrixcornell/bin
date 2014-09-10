#!/bin/sh

set -e

# XXX Note when updating to also update
# debian/flashplugin-installer.postinst and debian/post-download-hook
FLASH_VERSION=11.2.202.406
FILENAME=adobe-flashplugin_${FLASH_VERSION}.orig.tar.gz
SHA256SUM_TGZ="79f38756641e484a8db59dec646509a2a31bcc093efc10b966a5399d2c4d337a"

. /usr/share/debconf/confmodule

while true; do
	db_input medium flashplugin-installer/local || true
	db_go
	db_get flashplugin-installer/local
	if [ -n "$RET" ] && [ -d "$RET" ] && [ -f "$RET/$FILENAME" ] \
	   && echo "$SHA256SUM_TGZ  $RET/$FILENAME" | sha256sum -c > /dev/null 2>&1
	then
		break
	elif [ "x$RET" = "x" ]; then
		break
	fi
	db_reset flashplugin-installer/not_exist || true
	db_reset flashplugin-installer/local || true
	db_input medium flashplugin-installer/not_exist || true
	db_go
done
