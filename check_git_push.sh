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
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/contratos
echo contratos
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/espi
echo espi
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/estagio
echo estagio
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/estoque
echo estoque
git checkout develop && git push && git checkout master && git push && git checkout develop
git checkout develop_tela && git push && git checkout master && git push && git checkout develop_tela

echo
cd ~/public_html/semad/gestaodoc
echo gestaodoc
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/gestaonfe
echo gestaonfe
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/imoveis
echo imoveis
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/irp
echo irp
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/juridico
echo juridico
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/novosge
echo novosge
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/organizacional
echo organizacional
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/patrimonio
echo patrimonio
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/ponto
echo ponto
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/ponto-e
echo ponto-e
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/sbpg
echo sbpg
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/sbpg_ies_public
echo sbpg_ies_public
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/sbpg_public
echo sbpg_public
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/sishab
echo sishab
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~/public_html/semad/voyage
echo voyage
git checkout develop && git push && git checkout master && git push && git checkout develop

echo
cd ~

find ~/public_html/ -name '*tpl.php' -exec rm -rf {} \;
