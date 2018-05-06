#!/bin/bash

check_repack ()
{
	echo "Checking for dpkg-repack..."
	if command -v dpkg-repack > /dev/null; then
		echo "Detected dpkg-repack..."
	else
		echo "Installing dpkg-repack..."
		sudo -E apt-get install -q -y dpkg-repack
	fi
}

reset

data=`/bin/date +%Y%m%d_%H%M%S`
machine=`/bin/uname -m`
release=`/bin/uname -r`
origin=${HOSTNAME}_${machine}_${USER}_${release}_${data}

check_repack

#set -xv
echo ${origin}
#if [ ! -d ~/bin/repack ]; then mkdir -p ~/bin/repack; fi
repack="${HOME}/bin/repack"
if [ ! -d ${repack} ]; then mkdir -p ${repack}; fi


echo ${repack}/${origin}
dpkg --get-selections | awk '{if ($2=="install") print $1}' > ${repack}/${origin}_packages.list
cat ${repack}/${origin}_packages.list | awk '{ print "sudo -E dpkg-repack " $1 }' > ${repack}/${origin}_repack.sh
cat ${repack}/${origin}_packages.list | awk '{ print "sudo -E apt-get install -y --force-yes " $1 }' > ${repack}/${origin}_install.sh

rm ${repack}/${origin}_packages.list
chmod a+x ${repack}/${origin}_*.sh

sudo -E rm -rf /opt/${HOSTNAME}_${machine}*
sudo -E mkdir -p /opt/${origin}_DEBs
sudo -E chown 1000:1000 -R /opt/${origin}_DEBs
#set +xv; exit

cd ~
cd /opt/${origin}_DEBs
sh ${repack}/${origin}_repack.sh
sudo -E chown 1000:1000 -R /opt/${origin}_DEBs
