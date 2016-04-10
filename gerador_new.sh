#!/bin/bash
data=`/bin/date +%Y%m%d_%H%M%S`
machine=`/bin/uname -m`
release=`/bin/uname -r`
origin=${HOSTNAME}_${machine}__${release}_${data}

dpkg --get-selections | awk '{if ($2=="install") print $1}' > ~/bin/${origin}_packages.list
cat ~/bin/${origin}_packages.list | awk '{ print "sudo dpkg-repack " $1 " && sudo chown 1000:1000 " $1 "*" }' > ~/bin/${origin}_repack.sh
cat ~/bin/${origin}_packages.list | awk '{ print "sudo apt-get install -y --force-yes " $1 }' > ~/bin/${origin}_install.sh

rm ~/bin/${origin}_packages.list
chmod a+x ~/bin/${origin}_*.sh

sudo mkdir /opt/${origin}_DEBs
sudo chown 1000:1000 -R /opt/${origin}_DEBs

cd ~
cd /opt/${origin}_DEBs
sh ~/bin/${origin}_repack.sh
sudo chown 1000:1000 -R /opt/${origin}_DEBs
