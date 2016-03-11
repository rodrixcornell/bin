#!/bin/bash
#sudo echo 'test sudo'
data=`/bin/date +%Y%m%d_%H%M%S`
machine=`/bin/uname -m`
origin=${HOSTNAME}__${machine}__${data}
way='/var/www/'

echo Foram digitados $# parâmetros. São eles: $*.
echo O primeiro parâmetro foi: $1
echo O segundo parâmetro foi: $2
echo O nome do script é: $0
echo

if [ -z "$1" ]; then echo "escreva o nome do projeto sem '_web'"; fi

repositories=$1

if [[ ${HOSTNAME} == "ludhriq-t4500" && "$2" == "dev" ]]
then
	repositories=${repositories}_dev_web.git
else 
	repositories=$1_web.git
fi

echo Repositório ${repositories} ${origin}
