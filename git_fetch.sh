#!/bin/bash

echo 'Git Fetch All!!!'
if [[ -d ${HOME}/repos ]]; then
	cd ${HOME}/repos/vo/contaspublicas_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/contratos_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/espi_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/estagio_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/estoque_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/folha_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/gestaodoc_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/gestaonfe_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/imoveis_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/irp_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/juridico_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/nfe_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/organizacional_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/patrimonio_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/pbpg_ies_public_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/pbpg_public_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/pbpg_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/ponto-e_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/ponto_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/recebimento_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/redmine_cli_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/redmine_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/sbpg_bolsista_public_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/sbpg_ies_public_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/sbpg_public_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/sbpg_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/semad2010_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/semad_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/semad_wp_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/sishab_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/sme_web.git && pwd && git fetch --all
	cd ${HOME}/repos/vo/voyage_web.git && pwd && git fetch --all

	echo 'Git Fetch All Thupan!!!'
	cd ${HOME}/repos/thupan/chamados.git && pwd && git fetch --all
fi

if [[ -d ${HOME}/public_html/semad ]]; then
	cd ${HOME}/public_html/semad/contaspublicas && pwd && git fetch --all
	cd ${HOME}/public_html/semad/contratos && pwd && git fetch --all
	cd ${HOME}/public_html/semad/espi && pwd && git fetch --all
	cd ${HOME}/public_html/semad/estagio && pwd && git fetch --all
	cd ${HOME}/public_html/semad/estoque && pwd && git fetch --all
	cd ${HOME}/public_html/semad/estoque_20160425 && pwd && git fetch --all
	cd ${HOME}/public_html/semad/gestaodoc && pwd && git fetch --all
	cd ${HOME}/public_html/semad/gestaonfe && pwd && git fetch --all
	cd ${HOME}/public_html/semad/imoveis && pwd && git fetch --all
	cd ${HOME}/public_html/semad/irp && pwd && git fetch --all
	cd ${HOME}/public_html/semad/juridico && pwd && git fetch --all
	cd ${HOME}/public_html/semad/New_Config && pwd && git fetch --all
	cd ${HOME}/public_html/semad/novosge && pwd && git fetch --all
	cd ${HOME}/public_html/semad/organizacional && pwd && git fetch --all
	cd ${HOME}/public_html/semad/patrimonio && pwd && git fetch --all
	cd ${HOME}/public_html/semad/ponto && pwd && git fetch --all
	cd ${HOME}/public_html/semad/ponto-e && pwd && git fetch --all
	cd ${HOME}/public_html/semad/prefeitura_notas && pwd && git fetch --all
	cd ${HOME}/public_html/semad/recebimento && pwd && git fetch --all
	cd ${HOME}/public_html/semad/sbpg && pwd && git fetch --all
	cd ${HOME}/public_html/semad/sbpg_bolsista_public && pwd && git fetch --all
	#cd ${HOME}/public_html/semad/sbpg_ies_public && pwd && git fetch --all
	cd ${HOME}/public_html/semad/sbpg_public && pwd && git fetch --all
	#cd ${HOME}/public_html/semad/sge && pwd && git fetch --all
	cd ${HOME}/public_html/semad/siscfg && pwd && git fetch --all
	cd ${HOME}/public_html/semad/sishab && pwd && git fetch --all
	cd ${HOME}/public_html/semad/sissge && pwd && git fetch --all
	cd ${HOME}/public_html/semad/sme && pwd && git fetch --all
	cd ${HOME}/public_html/semad/voyage && pwd && git fetch --all
fi

if [[ -d ${HOME}/public_html/thupan ]]; then
	cd ${HOME}/public_html/thupan/chamados && pwd && git fetch --all
	cd ${HOME}/public_html/thupan/pmm && pwd && git fetch --all
	cd ${HOME}/public_html/thupan/test && pwd && git fetch --all
fi