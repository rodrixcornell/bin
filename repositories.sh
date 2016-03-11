#!/bin/bash
#sudo echo 'test sudo'
umask 002
data=`/bin/date +%Y%m%d_%H%M%S`
machine=`/bin/uname -m`
origin=${HOSTNAME}__${machine}__${data}
way='/var/www/'

if [ -z "$1" ]; then echo "escreva o nome do projeto sem '_web'"; fi

repositories=$1

if [[ ${HOSTNAME} == "daraa" ]]; then dir_www='semad/' branch_www='develop'; fi
if [[ ${HOSTNAME} == "cruxati" ]]; then dir_www='sistemaspmm/' branch_www='ratify'; fi
if [[ ${HOSTNAME} == "apuau" ]]; then dir_www='/' branch_www='master'; fi
if [[ ${HOSTNAME} == "liberdade" ]]; then dir_www='sistemaspmm/' branch_www='master'; fi
if [[ ${HOSTNAME} == "php5" ]]; then dir_www='/' branch_www='master'; fi
if [[ ${HOSTNAME} == "php5" && $2 == 'dev' ]]; then dir_www='/' branch_www='develop' repositories=${repositories}_dev; fi

echo Repositório ${repositories} ${origin}

#if [[ -d ~/repositories/${repositories}_web.git ]]; then rm -rfv ~/repositories/${repositories}_web.git; fi
if [[ -d ${HOME}/repositories/${repositories}_web.git ]]; then rm -rf ${HOME}/repositories/${repositories}_web.git; fi

if [[ -d ${way}${dir_www}${repositories} ]]
then
	cd ${HOME}/bkp
	#tar -czvf ~/bkp/${origin}__${repositories}.tgz ${way}${dir_www}${repositories}
	tar -czf ${origin}__${repositories}.tgz ${way}${dir_www}${repositories}
	echo ${origin}__${repositories}.tgz ${way}${dir_www}${repositories}
	#rm -rfv ${way}${dir_www}${repositories}
	rm -rf ${way}${dir_www}${repositories}
fi

mkdir -p ${HOME}/repositories/${repositories}_web.git
cd ${HOME}/repositories/${repositories}_web.git
git init --bare
cd hooks
touch post-receive

echo '#!/bin/sh

umask 002
data=`/bin/date +%Y%m%d_%H%M%S`
data_deploy=`/bin/date "+%d/%m/%Y %H:%M:%S"`
machine=`/bin/uname -m`
origin='${HOSTNAME}'__${machine}__${data}
way="'${way}'"

echo
echo "-- hooks '${HOSTNAME}' -- ${data_deploy}"
echo "Repositório '${repositories}'"
echo ${way}'${dir_www}'
echo

unset GIT_DIR
unset GIT_WORK_TREE
#sudo chmod 775 -R ${way}*
sudo chmod g+w -R ${way}*
#sudo chgrp www-data -R ${way}*

sudo service apache2 stop
sudo find ${way} -iname '*.tpl.php' -exec rm -rf {} \;

#tar -czvf ~/bkp/${origin}__deploy_'${branch_www}'__'${repositories}'.tgz ${way}'${dir_www}${repositories}'
tar -czf ~/bkp/${origin}__deploy_'${branch_www}'__'${repositories}'.tgz ${way}'${dir_www}${repositories}'

cd ${way}'${dir_www}${repositories}'

git checkout -f
git pull origin '${branch_www}'

if [ -d templates ]
then
	mkdir -p templates_c
else
	if [ ! -d vendor ]; then composer update; fi
fi
#if [ -d templates_c ]; then chmod 775 -R templates_c; fi
#if [ -d runtime ]; then chmod 775 -R runtime; fi
#if [ -d web/assets ]; then chmod 775 -R web/assets; fi
#if [ -d web/uploads ]; then chmod 775 -R web/uploads; fi

git log -10 HEAD > log
echo >> log
echo Data Deploy: '${HOSTNAME}' ${data_deploy} >> log

sudo service apache2 start
' >> post-receive
chmod +x post-receive

cd ${way}${dir_www}

#echo ${branch_www} ${HOME}/repositories/${repositories}_web.git ${repositories}
git clone -b ${branch_www} ${HOME}/repositories/${repositories}_web.git ${repositories}
#git clone ~/repositoriessitories/${repositories}_web ${repositories}

#cd ${way}sistemaspmm/${repositories}
#git checkout develop
