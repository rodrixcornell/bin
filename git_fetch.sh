#!/bin/bash

for i in $(cd ~ && ls -r */*.git | grep -i : | sed "s/://"); do cd ~ && echo $(pwd)/$i && cd $(pwd)/$i && git fetch --all 2>&1; done
for i in $(cd ~ && ls -r */*/*.git | grep -i : | sed "s/://"); do cd ~ && echo $(pwd)/$i && cd $(pwd)/$i && git fetch --all 2>&1; done

#echo 'Git Fetch All!!!'
#cd ${HOME}/repos/vo/contaspublicas.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/contratos.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/espi.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/estagio.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/estoque.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/folha.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/gestaodoc.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/gestaonfe.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/imoveis.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/irp.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/juridico.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/nfe.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/novosge.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/organizacional.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/patrimonio.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/ponto-e.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/ponto.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/recebimento.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/redmine_cli.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/sbpg_bolsista.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/sbpg_ies.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/sbpg_public.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/sbpg.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/sge.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/semad2010.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/semad.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/siscfg.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/sishab.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/sme.git && pwd && git fetch --all
#cd ${HOME}/repos/vo/voyage.git && pwd && git fetch --all

#echo 'Git Fetch All Thupan!!!'
#cd ${HOME}/repos/thupan/administrativo.git && pwd && git fetch --all
#cd ${HOME}/repos/thupan/catalogacao.git && pwd && git fetch --all
#cd ${HOME}/repos/thupan/chamados.git && pwd && git fetch --all
#cd ${HOME}/repos/thupan/contratos.git && pwd && git fetch --all
#cd ${HOME}/repos/thupan/estagio.git && pwd && git fetch --all
#cd ${HOME}/repos/thupan/gpm.git && pwd && git fetch --all
#cd ${HOME}/repos/thupan/pmm-tube.git && pwd && git fetch --all
#cd ${HOME}/repos/thupan/ponto.git && pwd && git fetch --all
#cd ${HOME}/repos/thupan/sac.git && pwd && git fetch --all
#cd ${HOME}/repos/thupan/webserve.git && pwd && git fetch --all

#echo 'Git Fetch All Third Party!!!'
#cd ${HOME}/repos/tps/semad_wpress.git && pwd && git fetch --all
#cd ${HOME}/repos/tps/semad2_wpress.git && pwd && git fetch --all

#echo 'Git Fetch All RubyOnRails!!!'
#cd ${HOME}/repos/ror/redmine.git && pwd && git fetch --all

#echo 'Git Fetch All Delphi!!!'
#cd ${HOME}/repos/pmm-system/contaspublicas.git && pwd && git fetch --all
#cd ${HOME}/repos/pmm-system/gestaocontaspublicas.git && pwd && git fetch --all
#cd ${HOME}/repos/pmm-system/habitacao.git && pwd && git fetch --all
#cd ${HOME}/repos/pmm-system/pontoquiosquev2.git && pwd && git fetch --all

