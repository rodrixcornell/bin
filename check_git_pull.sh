#!/bin/bash
#clear
echo
data=`/bin/date +%Y%m%d`
echo $data
#echo ${data}

cd ~

echo
cd ~/public_html/semad/contaspublicas
echo contaspublicas
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/contratos
echo contratos
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/espi
echo espi
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/estagio
echo estagio
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/estoque
echo estoque
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop
#git checkout -f develop_tela && git pull && git checkout -f master && git pull && git checkout -f develop_tela

echo
cd ~/public_html/semad/gestaodoc
echo gestaodoc
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/gestaonfe
echo gestaonfe
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/imoveis
echo imoveis
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/irp
echo irp
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/juridico
echo juridico
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/novosge
echo novosge
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/organizacional
echo organizacional
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/patrimonio
echo patrimonio
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/ponto
echo ponto
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/ponto-e
echo ponto-e
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/recebimento
echo recebimento
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/sbpg
echo sbpg
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/sbpg_bolsista_public
echo sbpg_bolsista_public
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/sbpg_ies_public
echo sbpg_ies_public
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/sbpg_public
echo sbpg_public
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/sishab
echo sishab
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~/public_html/semad/voyage
echo voyage
git checkout -f develop && git pull && git checkout -f master && git pull && git checkout -f develop

echo
cd ~

find ~/public_html/ -name '*tpl.php' -exec rm -rf {} \;
