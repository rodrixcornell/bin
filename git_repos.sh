#!/bin/bash
# git_repos.sh
#
# Cria repositório e configura para receber os deploy
#
# Versão 2: Tentando melhor estruturar programa.
# 			Opções no help!
#
# Rodrigo Cabral, 20160707_111929_338759516
#

umask 002
DATA=$(/bin/date +%Y%m%d.%H%M%S.%N)
#MACHINE=`/bin/uname -m`
#ORIGIN=${HOSTNAME}_${MACHINE}_${DATA}
ORIGIN=${HOSTNAME}_${DATA}

DIR_WWW=/var/www
REPOS=${HOME}/repositories

REPOSITORIES=''
FRAMEWORK=''
BRANCH=''

MENSAGEM_USO="
Escreva o nome do projeto sem '_web'

Uso: $(basename "$0") [OPÇÕES]

OPÇÕES:
  -r, --repositories Nome do repositorio a ser criado
  -f, --framework    Framework: vo, thupan, laravel & etc...

  -h, --help         Mostra esta tela de ajuda e sai
  -V, --version      Mostra a versão do programa e sai
"

MENSAGEM_USO_OLD="
Escreva o nome do projeto sem '_web'

Uso: $(basename "$0") [OPÇÕES]

OPÇÕES:
  -r, --repositories Nome do repositorio a ser criado
  -f, --framework    Framework: vo, thupan, laravel & etc...
  -b, --branch       Branch: develop, ratify ou master

  -h, --help         Mostra esta tela de ajuda e sai
  -V, --version      Mostra a versão do programa e sai
"

zip_check ()
{
	echo "Checking for zip..."
	if command -v zip > /dev/null; then
		echo "Detected zip..."
	else
		echo "Installing zip..."
		sudo apt-get install -q -y zip
	fi
}

unzip_check ()
{
	echo "Checking for zip..."
	if command -v unzip > /dev/null; then
		echo "Detected zip..."
	else
		echo "Installing zip..."
		sudo apt-get install -q -y unzip
	fi
}

git_check ()
{
	echo "Checking for git..."
	if command -v git > /dev/null; then
		echo "Detected git..."
	else
		echo "Installing git..."
		sudo apt-get install -q -y git
	fi
}

git_hooks ()
{
	git init --bare
	cd hooks
	touch post-receive

	echo '#!/bin/sh

umask 002
DATA=$(/bin/date +%Y%m%d.%H%M%S.%N)
#MACHINE=`/bin/uname -m`
#ORIGIN=${HOSTNAME}_${MACHINE}_${DATA}
ORIGIN=${HOSTNAME}_${DATA}
DEPLOY_INICIO=$(/bin/date +%H%M%S)
DEPLOY_FIM=''

DIR_WWW='${DIR_WWW}'
REPOS=${HOME}/repositories

REPOSITORIES='${REPOSITORIES}'
FRAMEWORK='${FRAMEWORK}'
BRANCH='${BRANCH}'

echo
echo "-- hooks ${ORIGIN}"
echo "Repositório ${REPOSITORIES}"
echo ${DIR_WWW}
echo

unset GIT_DIR
unset GIT_WORK_TREE
#sudo chmod 775 -R ${DIR_WWW}*
sudo chmod g+w -R ${DIR_WWW}*
sudo chgrp www-data -R ${DIR_WWW}*

sudo service apache2 restart
sudo find ${DIR_WWW} -iname '*.tpl.php' -exec rm -rf {} \;

echo Backup ${DIR_WWW}/${FRAMEWORK}/${REPOSITORIES} ${BRANCH} - ${ORIGIN}
if [ "${FRAMEWORK}" = thupan ]; then
	cd ${DIR_WWW}/${FRAMEWORK}
	rm -rfv ${REPOSITORIES}/vendor
	zip -r ${FRAMEWORK}_${REPOSITORIES}_deploy_${DATA}.zip ${REPOSITORIES}
	mv -fv ${FRAMEWORK}_${REPOSITORIES}_deploy_${DATA}.zip ${HOME}/bkp
	cd ${REPOSITORIES}
	if [ -d public/files ]; then
		zip -r ${FRAMEWORK}_${REPOSITORIES}_files_${DATA}.zip public/files
		mv -fv ${FRAMEWORK}_${REPOSITORIES}_files_${DATA}.zip ${HOME}/bkp
	fi

	git reset
	git checkout -f
	git pull -u origin ${BRANCH}
	git log -10 HEAD> public/log && echo>> public/log && echo Maquina e Data e Hora do Deploy:>> public/log && echo ${ORIGIN}>> public/log

	if [ -f ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_files_${DATA}.zip ]; then unzip -o ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_files_${DATA}.zip; fi

	sudo composer self-update
	composer update
fi

if [ "${FRAMEWORK}" = vo ]; then
	cd ${DIR_WWW}/${FRAMEWORK}
	zip -r ${FRAMEWORK}_${REPOSITORIES}_deploy_${DATA}.zip ${REPOSITORIES}
	mv -fv ${FRAMEWORK}_${REPOSITORIES}_deploy_${DATA}.zip ${HOME}/bkp
	cd ${REPOSITORIES}
	if [ -d arquivo ]; then
		zip -r ${FRAMEWORK}_${REPOSITORIES}_arquivo_${DATA}.zip arquivo
		mv -fv ${FRAMEWORK}_${REPOSITORIES}_arquivo_${DATA}.zip ${HOME}/bkp
	fi
	if [ -d arquivos ]; then
		zip -r ${FRAMEWORK}_${REPOSITORIES}_arquivos_${DATA}.zip arquivos
		mv -fv ${FRAMEWORK}_${REPOSITORIES}_arquivos_${DATA}.zip ${HOME}/bkp
	fi

	git reset
	git checkout -f
	git pull -u origin ${BRANCH}
	git log -10 HEAD> log && echo>> log && echo Maquina e Data e Hora do Deploy:>> log && echo ${ORIGIN}>> log

	if [ -f ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_arquivo_${DATA}.zip ]; then unzip -o ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_arquivo_${DATA}.zip; fi
	if [ -f ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_arquivos_${DATA}.zip ]; then unzip -o ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_arquivos_${DATA}.zip; fi

	mkdir -p templates_c
	chmod 775 -R templates_c
	chgrp www-data -R templates_c
fi

sudo service apache2 restart

DEPLOY_FIM=`/bin/date +%H%M%S`
echo $DEPLOY_INICIO
echo $DEPLOY_FIM
echo $DEPLOY_FIM-$DEPLOY_INICIO|bc
echo "segundos"
' >> post-receive && chmod +x post-receive
}


# Tratamento das opções de linha de comando

if [ -z "$1" ]
then
	echo "$MENSAGEM_USO"
	exit 0
fi

while test -n "$1"
do
	case "$1" in
		-f | --framework)
			shift
			FRAMEWORK=$(echo "$1" | tr A-Z a-z)
		;;
		-r | --repositories)
			shift
			REPOSITORIES=$(echo "$1" | tr A-Z a-z)
		;;

#		-s | --schema)
#			shift
#			SCHEMA=$(echo "$1" | tr A-Z a-z)
#		;;
#		-b | --branch)
#			shift
#			BRANCH=$(echo "$1" | tr A-Z a-z)
#		;;

		-h | --help)
			echo "$MENSAGEM_USO"
			exit 0
		;;
		-V | --version)
			echo -n $(basename "$0")
			# Extrai a versão diretamente dos cabeçalhos do programa
			grep '^# Versão ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
			exit 0
		;;

		*)
			echo Opção inválida: $1
			exit 1
		;;
	esac

	# Opção $1 já processada, a fila deve andar
	shift
done

case "$HOSTNAME" in
	php5) BRANCH="develop" ;;
	paranoa) BRANCH="develop" ;;
	cruxati) BRANCH="ratify" ;;
	daraa) BRANCH="master" ;;
	apuau) BRANCH="master" ;;
	*) echo Opção inválida: $1 exit 1 ;;
esac

reset

echo
echo Executando "$0"
zip_check
unzip_check
git_check

if [ "${FRAMEWORK}" = '' ]; then
	echo "Framework não identificado!"
else
	echo
	echo
	if [[ ! -d ${HOME}/repositories/${FRAMEWORK}/${REPOSITORIES}.git || -d ${HOME}/repositories/${FRAMEWORK}/${REPOSITORIES}.git ]]; then
		echo Repositório ${FRAMEWORK}/${REPOSITORIES} ${BRANCH} - ${ORIGIN}
		echo
		rm -rfv ${HOME}/repositories/${FRAMEWORK}/${REPOSITORIES}.git
		mkdir -p ${HOME}/repositories/${FRAMEWORK}/${REPOSITORIES}.git
		cd ${HOME}/repositories/${FRAMEWORK}/${REPOSITORIES}.git
		echo
		echo Cria Git Hooks
		git_hooks
	fi

	if [[ "${FRAMEWORK}" = thupan ]]; then
		cd ${DIR_WWW}
		if [[ -d ${FRAMEWORK}/${REPOSITORIES} ]]; then
			echo Backup ${FRAMEWORK}/${REPOSITORIES} ${BRANCH} - ${ORIGIN}
			cd ${DIR_WWW}/${FRAMEWORK}
			rm -rfv ${REPOSITORIES}/vendor
			zip -r ${FRAMEWORK}_${REPOSITORIES}_${DATA}.zip ${REPOSITORIES}
			mv -fv ${FRAMEWORK}_${REPOSITORIES}_${DATA}.zip ${HOME}/bkp
			cd ${REPOSITORIES}
			if [ -d public/files ]; then
				zip -r ${FRAMEWORK}_${REPOSITORIES}_files_${DATA}.zip public/files
				mv -fv ${FRAMEWORK}_${REPOSITORIES}_files_${DATA}.zip ${HOME}/bkp
			fi
			cd ${DIR_WWW}
			sudo rm -rfv ${FRAMEWORK}/${REPOSITORIES}
		fi

		cd ${DIR_WWW}
		echo
		echo Git Clone
#		git clone -b ${BRANCH} ${HOME}/repositories/${FRAMEWORK}/${REPOSITORIES} ${FRAMEWORK}/${REPOSITORIES}
		git clone ${HOME}/repositories/${FRAMEWORK}/${REPOSITORIES} ${FRAMEWORK}/${REPOSITORIES}

		cd ${FRAMEWORK}/${REPOSITORIES}
		#git pull -u ${BRANCH}
		#composer update

		if [[ -f ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_files_${DATA}.zip ]]; then unzip -o ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_files_${DATA}.zip; fi

		cd ~

		echo ${DIR_WWW}
		if [ -d ${DIR_WWW}/pmm/sistemas ]; then
			cd ${DIR_WWW}/pmm/sistemas
		else 
			cd ${DIR_WWW}/pmm
		fi
		mkdir -p ${FRAMEWORK}
		ln -sf ${DIR_WWW}/${FRAMEWORK}/${REPOSITORIES}/public ${FRAMEWORK}/${REPOSITORIES}
	fi

	if [[ "${FRAMEWORK}" = vo ]]; then
		cd ${DIR_WWW}
		if [[ -d ${FRAMEWORK}/${REPOSITORIES} ]]; then
			echo Backup ${REPOSITORIES} ${BRANCH} - ${ORIGIN}
			cd ${DIR_WWW}/${FRAMEWORK}
			zip -r ${FRAMEWORK}_${REPOSITORIES}_${DATA}.zip ${REPOSITORIES}
			mv -fv ${FRAMEWORK}_${REPOSITORIES}_${DATA}.zip ${HOME}/bkp
			cd ${REPOSITORIES}
			if [ -d arquivo ]; then
				zip -r ${FRAMEWORK}_${REPOSITORIES}_arquivo_${DATA}.zip arquivo
				mv -fv ${FRAMEWORK}_${REPOSITORIES}_arquivo_${DATA}.zip ${HOME}/bkp
			fi
			if [ -d arquivos ]; then
				zip -r ${FRAMEWORK}_${REPOSITORIES}_arquivos_${DATA}.zip arquivos
				mv -fv ${FRAMEWORK}_${REPOSITORIES}_arquivos_${DATA}.zip ${HOME}/bkp
			fi

			cd ${DIR_WWW}
			#sudo find ${DIR_WWW} -iname '*.tpl.php' -exec rm -rf {} \;
			sudo rm -rfv ${FRAMEWORK}/${REPOSITORIES}
		fi

		cd ${DIR_WWW}
		echo
		echo Git Clone
#		git clone -b ${BRANCH} ${HOME}/repositories/${FRAMEWORK}/${REPOSITORIES} ${FRAMEWORK}/${REPOSITORIES}
		git clone ${HOME}/repositories/${FRAMEWORK}/${REPOSITORIES} ${FRAMEWORK}/${REPOSITORIES}

		cd ${FRAMEWORK}/${REPOSITORIES}
		#git pull -u ${BRANCH}
		mkdir -p templates_c && chmod 775 -R templates_c && chgrp www-data -R templates_c

		if [[ -f ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_arquivos_${DATA}.zip ]]; then unzip -o ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_arquivos_${DATA}.zip; fi
		if [[ -f ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_arquivo_${DATA}.zip ]]; then unzip -o ${HOME}/bkp/${FRAMEWORK}_${REPOSITORIES}_arquivo_${DATA}.zip; fi

		cd ~

		if [ -d ${DIR_WWW}/pmm/sistemas ]; then
			cd ${DIR_WWW}/pmm/sistemas
		else 
			cd ${DIR_WWW}/pmm
		fi
		
		ln -sf ${DIR_WWW}/${FRAMEWORK}/${REPOSITORIES}
	fi
fi

echo $REPOSITORIES $FRAMEWORK $SCHEMA $BRANCH
