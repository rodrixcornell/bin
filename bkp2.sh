#!/bin/bash
sudo echo 'test sudo'
data=`/bin/date +%Y%m%d_%H%M%S`
machine=`/bin/uname -m`
origin=${HOSTNAME}__${machine}__${data}

way='/var/www/'


sudo chmod 775 -R ${way}*
sudo chgrp www-data -R ${way}*
sudo find ${way} -iname '*.tpl.php' -exec rm -rfv {} \;

if [ -z $1 ]
then
	if [ -d ${way}sistemaspmm ]
	then
		tar -czvf ~/bkp/${origin}__geral.tgz ${way}sistemaspmm
	else
		tar -czvf ~/bkp/${origin}__geral.tgz ${way}
	fi
else
	if [ -d ${way}sistemaspmm ]
	then
		tar -czvf ~/bkp/${origin}__$1.tgz ${way}sistemaspmm/$1
	else
		tar -czvf ~/bkp/${origin}__$1.tgz ${way}$1
	fi
fi;