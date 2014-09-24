#!/bin/bash
# 
# --------------------------------------------
# Criado em: Qua 29/Jul/2009 - 11:22hs
# Autor: Jamilson Silva <jscarmo@ig.com.br>
# Manutenção: 
# --------------------------------------------
# 
# Propósito Script:  
# 
# 
# Histórico: 
#   v1.0 - Aprendendo a usar o comando date
#   v1.0.1 - Incluida a opção -h, --help
#   v1.0.2 - Arrumado o bug quando alguma opção é passada errada 	
#   v1.0.3 - Incluidas as opções (-t, --tudo), (-d, --dia), (-b, --bi)
#
# Licença: GPL

# Inicialização das variáveis
VERSAO=$(grep '^#   v' $0 | tail -n 1 | cut -d"-" -f1 | tr -d "#v") # Extrai versão do cabeçalho do programa
ESTADO="Manaus,AM" # Define nome do estado e sua capital
EXTENSO=0          # Ativa a data por extenso
HORA=0             # Ativa a hora
TUDO=0             # Ativa data completa
ANO=0              # Ativa a verificaçã se ano é bissexto ou não
DIA=0              # Ativa verificação do dia da semana

SOBRE="
mostrando_datas $VERSAO\n\n
Copyright © 2009 Free Software Foundation, Inc.\n
Licença GPLv3+: GNU GPL versão 3 ou posterior <http://gnu.org/licenses/gpl.html>\n
Este software é livre: você é livre para mudá-lo e redistribuí-lo.\n
NÃO HÁ GARANTIA, para a extensão permitida por lei.\n\n

Escrito por Jamilson Silva.\n
"

MENSAGEM_USO="\n
Uso: `basename $0` [OPÇÕES]\n\n
	\tOPÇÕES:\n
	\t -e, --ext       \tMostra data na forma extensa\n
	\t -h, --hora      \tMostra a hora\n
	\t -t, --tudo      \tMostra a data completa\n
	\t -a, --ajuda	    \tMostra esta tela e sai\n
	\t -d, --dia       \tMostra o dia da semana\n
	\t -b, --bi        \tMostra se o ano é bissexto ou não\n
	\t -v, --versao 	 \tMostra a versão do programa e sai
\n\n
Comunicar 'bugs' para <jscarmo@ig.com.br> 
"

ERRO="\n
$0: opção inválida -- '`echo "$1" | tr -d "-" `'\n
Tente '$0 --help' para mais informação.\n
"

dia_semana(){
	dia=$(date +%w)
	if [ $dia -eq 0 ]; then
		echo -e "\nDia da Semana: $(date +%A)\n"
	elif [ $dia -eq 6 ]; then
		echo -e "\nDia da Semana: $(date +%A)\n"
	else
		echo -e "\nDia da Semana: $(date +%A)-feira\n"
	fi		
}

ano_bissexto(){
	ano=$(cal 2 $(date +%Y) | grep 29 | wc -l)
	if [ $ano -eq 1 ]; then
		echo -e "\nAno: É Bissexto"
	else
		echo -e "\nAno: Não É Bissexto"
	fi
	echo
}

if [ $# -eq 0 ]; then 
	date # $(date) 
	#echo -e "Você deve passar um parâmetro \nVerifique usando $0 -a para saber quais parâmetros usar\n"
fi

while [ -n "$1" ]; do
	case "$1" in
		-e|--ext) EXTENSO=1 
					 ;;
		-h|--hora) HORA=1 
					  ;;	
		-t|--tudo) TUDO=1
					  ;;
		-a|--ajuda) echo -e $MENSAGEM_USO 
						exit 0 
						;;
		-d|--dia) DIA=1
					 ;;
		-b|--bi) ANO=1
					;;
		-v|--versao) echo -e $SOBRE 
						 exit 0 
						 ;;
		*) echo -e $ERRO ; exit 1 
			;;
	esac 
	shift
done

if [ "$EXTENSO" = 1 ]; then
	echo -e "\n$(date +"Manaus,AM %d de %B de %Y")\n" 
fi

if [ "$HORA" = 1 ]; then
	echo   
	echo "Hora Certa: $(date +%H:%M:%S)"
	echo
fi

if [ "$ANO" = 1 ]; then
	ano_bissexto
fi

if [ "$DIA" = 1 ]; then
	dia_semana
fi

if [ "$TUDO" = 1 ]; then
	echo ""
	dia_semana
	echo "Hora: $(date +%H:%M:%S)"
	echo -e "\n$(date +"Manaus,AM %d de %B de %Y")" 
	ano_bissexto
fi

