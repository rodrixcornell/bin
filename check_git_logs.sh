#!/bin/bash
clear
echo
data=`/bin/date +%Y%m%d_%H%M%S`
machine=`/bin/uname -m`
release=`/bin/uname -r`
origin=${HOSTNAME}-${machine}__${data}
logs=git-log__${data}
echo $data

cd ~

if [ ! -d ~/bkp ];
then
    mkdir -p ~/bkp
fi

cd ~/bkp

if [ -n $1 ]
then 
	echo
	cd ~/public_html/semad/contaspublicas
	echo contaspublicas > ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/contratos
	echo contratos >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/espi
	echo espi >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/estagio
	echo estagio >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/estoque
	echo estoque >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/gestaodoc
	echo gestaodoc >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/gestaonfe
	echo gestaonfe >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/imoveis
	echo imoveis >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/irp
	echo irp >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/juridico
	echo juridico >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/novosge
	echo novosge >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/organizacional
	echo organizacional >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/patrimonio
	echo patrimonio >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/ponto
	echo ponto >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/recebimento
	echo recebimento >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/sbpg
	echo sbpg >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/sbpg_bolsista_public
	echo sbpg_bolsista_public >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/sbpg_ies_public
	echo sbpg_ies_public >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/sbpg_public
	echo sbpg_public >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/sishab
	echo sishab >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/semad/voyage
	echo voyage >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt

	echo
	cd ~/public_html/vo
	echo vo >> ~/bkp/${logs}__$1.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks --author $1 >> ~/bkp/${logs}__$1.txt
else
echo
	cd ~/public_html/semad/contaspublicas
	echo contaspublicas > ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/contratos
	echo contratos >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/espi
	echo espi >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/estagio
	echo estagio >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/estoque
	echo estoque >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/gestaodoc
	echo gestaodoc >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/gestaonfe
	echo gestaonfe >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/imoveis
	echo imoveis >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/irp
	echo irp >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/juridico
	echo juridico >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/novosge
	echo novosge >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/organizacional
	echo organizacional >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/patrimonio
	echo patrimonio >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/ponto
	echo ponto >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/recebimento
	echo recebimento >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/sbpg
	echo sbpg >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/sbpg_bolsista_public
	echo sbpg_bolsista_public >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/sbpg_ies_public
	echo sbpg_ies_public >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/sbpg_public
	echo sbpg_public >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/sishab
	echo sishab >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt

	echo
	cd ~/public_html/semad/voyage
	echo voyage >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt
	
	echo
	cd ~/public_html/vo
	echo vo >> ~/bkp/${logs}.txt
	git log --pretty=format:"%h; %s; %cd; %cn" --decorate --stat --since=5.weeks >> ~/bkp/${logs}.txt
fi

echo
cd ~

find ~/public_html/ -name '*tpl.php' -exec rm -rf {} \;
