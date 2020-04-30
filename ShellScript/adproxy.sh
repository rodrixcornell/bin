	#!/bin/bash

	clear
	while true
	do
	clear
	echo -e "
			Opcao		Acao
			==================================================
				1		ADICIONAR usuário
				2		ALTERAR senha de usuário
				3		LISTAR usuários cadastrados
			4             DELETAR usuário
			5             SAIR - Reiniciando o Squid
				0		SAIR
			==================================================
			Escolha uma das opcoes acima (0-5):"
	read Opcao
	case "$Opcao"
		in
			1)	echo -e "	Digite o nome do usuário: "
				read nome
				if cat /etc/squid/squid_passwd | grep "$nome:" 1>/dev/null 2>/dev/null
				then
					echo "ERRO! Usuário já cadastrado"
					sleep 2
				else
					htpasswd /etc/squid/squid_passwd "$nome"
					echo "Cadastro efetuado com sucesso!"
				echo "$nome" >> /etc/squid/users
					sleep 2
				fi
				;;
			2)	echo -e "	Digite o nome do usuário: "
			read nome
				if cat /etc/squid/squid_passwd | grep "$nome:" 1>/dev/null 2>/dev/null
				then
					htpasswd /etc/squid/squid_passwd "$nome"
					echo "Senha alterada com sucesso!"
					sleep 2
				else
					echo "ERRO! Usuário não existe"
					sleep 2
				fi
				;;
			3)	echo "Relacao de Usuários"
				echo "------------------------"
				cat /etc/squid/squid_passwd | cut -d : -f 1
				echo "------------------------"
			sleep 3
				;;
		4)	echo -e "	Digite o nome do usuário: "
				read nome
				if cat /etc/squid/squid_passwd | grep "$nome:" 1>/dev/null 2>/dev/null
				then
							htpasswd -D /etc/squid/squid_passwd "$nome"
				echo "Usuário excluido com sucesso!"
					sleep 2
			else
				echo "ERRO! Usuário não existe"
					sleep 2
			fi
						;;
		5)      echo "Reiniciando o SQUID... Aguarde um momento ..."
						service squid reload
			clear
			echo "SQUID reiniciado com sucesso..."
			exit
			;;
			0)      clear
			echo "Até logo..."
				exit
				;;
			*)	echo "		Somente sao validas opcoes entre 0 e 5"
				sleep 2
				;;
	esac
	done
	exit