#!/bin/bash
sudo echo 'test sudo'
data=`/bin/date +%Y%m%d_%H%M%S`
machine=`/bin/uname -m`
origin=${HOSTNAME}__${machine}__${data}

way='/var/www/'


sudo chmod 775 -R ${way}*
sudo chgrp www-data -R ${way}*
sudo find ${way} -iname '*.tpl.php' -exec rm -rfv {} \;

tar -czvf ~/bkp/${origin}__geral.tgz ${way}
