#!/bin/bash
data=`/bin/date +%Y%m%d`
machine=`/bin/uname -m`
origin=${HOSTNAME}__${machine}__${data}

dpkg --get-selections | awk '{if ($2=="install") print $1}' > ~/bin/${origin}__packages.list
cat ~/bin/${origin}__packages.list | awk '{ print "gksu dpkg-repack " $2 " && gksu chown 1000:1000 " $2 "*" }' > ~/bin/${origin}__repack.sh

chmod a+x ~/bin/${origin}__repack.sh
#sudo ~/packages-backup/./

if [ ! -d ~/Downloads/debs-packages-bkp ] ; then
    mkdir ~/Downloads/debs-packages-bkp
fi

cd ~
cd ~/Downloads/debs-packages-bkp
rm *deb
sh ${origin}__repack.sh

#rm -rf Packages
#rm -rf Packages.gz

#sudo dpkg-scanpackages ./dev/null > Packages
#sudo dpkg-scanpackages ./dev/null | sudo gzip -9c > Packages.gz 

#sudo chown 1000:1000 *deb

#rm -rf ~/packages-backup/debian_packages.list
#rm -rf ~/packages-backup/repack.sh
