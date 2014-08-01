#!/bin/sh -e
if [ "$(id -u)" != 0 ]; then
    echo "This script must be run as root (or sudo)."
    exit 1
fi

if [ "$(uname -p)" != "x86_64" ]; then
    echo "Only 64-bit systems are currently supported"
    exit 1
fi

REQS="wget lsb_release apt-key"
for REQ in $REQS; do
    if ! which $REQ > /dev/null; then
        echo "This script requires $REQ in your PATH."
        exit 1
    fi
done

if [ "$(lsb_release -si)" != "Ubuntu" ]; then
    echo "This script only supports Ubuntu."
    exit 1
fi

if ! test -d /etc/apt/sources.list.d; then
    echo "Directory /etc/apt/sources.list.d is missing."
    exit 1
fi

if ! apt-key list | grep -q 9BD8DC24; then
    echo "Adding Bitcasa signing key."
    wget -O- http://dist.bitcasa.com/release/bitcasa-releases.gpg.key 2> /dev/null | apt-key add -
fi

RELEASE=$(lsb_release -sc)
LISTFILE="/etc/apt/sources.list.d/bitcasa.list"
if ! test -f /etc/apt/sources.list.d/bitcasa.list; then
    echo "Creating $LISTFILE"
    echo "deb http://dist.bitcasa.com/release/ubuntu $RELEASE main" > $LISTFILE
fi
if ! grep -q $RELEASE $LISTFILE; then
    echo "Updating $LISTFILE"
    echo "deb http://dist.bitcasa.com/release/ubuntu $RELEASE main" > $LISTFILE
fi

echo "Now run the following command:"
echo "sudo apt-get update && sudo apt-get install bitcasa"
