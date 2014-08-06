#!/bin/bash

Principal() {

     clear

     dir="Diretorio Atual : `pwd`"

     kernel="Kernel : `uname -r`"

     arquitetura="Arquitetura : `uname -m`"


     echo "+--------------------------------------------------------+"

     echo "|                    Cro/9                               |"

     echo "+--------------------------------------------------------+"

     echo "|      Adicionar/ Remover usuarios no Ldap + Samba       |"

     echo "+--------------------------------------------------------+"

     echo

     echo $dir

     echo $kernel

     echo $arquitetura

     echo

     echo -ne "\033[32m#======= Menu de Opcoes ========#\033[m"

     echo

     echo "1. Adicionar um Usuario"

     echo "2. Deletar um Usuario"

     echo "3. Modificar senha de Usuario"

     echo "4. Lista Usuarios ( /Home )"

     echo "5. Sair"

     echo -n "Entre com a opcao desejada => "

     read opcao

     echo

     case $opcao in

        1) Adicionar ;;

        2) Deletar ;;

        3) Modificar ;;

        4) Lista ;;

        5) exit ;;

        *) "Opcao desconhecida." ; echo ; Principal ;;

     esac

  }


Adicionar() {

     echo -n "Entre com o login do usuario.: "

     read login

     echo -n "Entre com o nome completo do usuario.: "

     read nome

     echo

     echo "#===== Mensagens do sistema =====# "

     echo

     smbldap-useradd -a -m $login -c "$nome"

     echo

     echo -n "Entre com a senha do usuario.: "

     echo

     smbldap-passwd $login

     echo

     echo "Pressione qualquer tecla para continuar..."

     read msg

     Principal

  }


Lista () {

     echo -n "Lista de Usuarios Cadastrados ( /Home )"

     sleep 1

     echo

     ls -l /home

     echo "#===== Mensagens do sistema =====#"

     echo

     echo "Pressione qualquer tecla para continuar..."

     read msg

     Principal

  }

 Modificar() {

     echo -n "Entre com o login do usuario para modificar a Senha: "

     read login

     echo -n "Entre com a senha do usuario.: "

     echo

     smbldap-passwd $login

     echo -n "#-- Forca Usuario a trocar a senha --#"

     echo

     smbldap-usermod -B 1 -A 1 $login

     echo

     echo "#===== Mensagens do sistema =====# "

     echo

     echo "Pressione qualquer tecla para continuar..."

     read msg

     Principal

  }

Deletar() {

     echo -ne '\033[31m****** CUIDADO ANTES DE EXECUTAR ESTA OPERACAO ******\033                                              [m'

     echo

     echo -n "Entre com o login do usuario a deletar.: "

     read login

     echo

     echo "#===== Mensagens do sistema =====#"

     echo

     smbldap-userdel -r $login

     echo

     echo "Pressione qualquer tecla para continuar..."

     read msg

     Principal

  }

  Principal


