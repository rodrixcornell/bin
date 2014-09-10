#!/bin/bash


Principal() {

     clear

     dir="Diretorio Atual : `pwd`"

     kernel="Kernel : `uname -r`"

     arquitetura="Arquitetura : `uname -m`"


     echo "+--------------------------------------------------------+"

     echo "|           SEMAD - DSTI - SUPORTE - REDES               |"

     echo "+--------------------------------------------------------+"

     echo "|    Manutencao de Logins e Grupos no Ldap (SEMPLAD)     |"

     echo "+--------------------------------------------------------+"

     echo

     echo $dir

     echo $kernel

     echo $arquitetura

     echo

     echo

     echo -ne "\033[32m#======= OPCOES ========#\033[m"

     echo

     echo

     echo " 1. Criar usuario"

     echo " 2. Excluir Usuario"

     echo " 3. Alterar senha do Usuario"

     echo " 4. Criar Grupo"

     echo " 5. Excluir Grupo"

     echo " 6. Incluir Usuario no Grupo"

     echo " 7. Excluir Usuario do Grupo"

     echo " 8. Exibe os Usuarios do Grupo"

     echo " 9. Exibir quais os Grupos do Usuario"

     echo "10. Exibe Informacoes do Login do Usuario"

     echo "11. Sair"

     echo

     echo -n "Entre com a opcao desejada => "

     read opcao

     echo

     echo

     case $opcao in

        1) Criar ;;

        2) Excluir ;;

        3) Alterar ;;

        4) CriaGrupo ;;

        5) ExcluiGrupo ;;

        6) IncluiUserGrupo ;;

        7) ExcluiUserGrupo ;;

        8) ExibeUserGrupo ;;

        9) ExibeGrupoUser ;;

        10) InfoUser ;;

        11) exit ;;

        *) "Opcao desconhecida." ; echo ; Principal ;;

     esac

  }


Criar() {

     echo -n "Entre com o login do usuario (nome.sobrenome).: "

     read login

     echo -n "Entre com o nome completo do usuario.: "

     read nome

     echo

     echo "#===== Mensagens do sistema =====# "

     echo

     smbldap-useradd -a -c "$nome" -P $login

     echo

     echo "Usuario $login criado com sucesso!!!"

     echo

     echo "Pressione qualquer tecla para continuar..."

     read msg

     Principal

  }


 Alterar() {

     echo -n "Entre com o login do usuario para Alterar a Senha: "

     read login

     echo -n "Entre com a senha do usuario.: "

     echo

     echo "#======= Mensagem do Sistema =======#"

     echo

     smbldap-usermod -B 1 -A 1 $login

     echo

     echo "A senha do login $login foi alterada com sucesso..."

     echo

     echo "Pressione qualquer tecla para continuar..."

     read msg

     Principal

  }

Excluir() {

     echo -ne '\033[31m****** CUIDADO ANTES DE EXECUTAR ESTA OPERACAO ******\033                                              [m'

     echo

     echo

     echo -n "Entre com o login do usuario a excluir.: "

     read login

     echo

     echo "#===== Mensagens do sistema =====#"

     echo

     smbldap-userdel -r $login

     echo

     echo "Usuario $login  deletado com sucesso!"

     echo

     echo "Pressione qualquer tecla para continuar..."

     read msg

     Principal

  }

CriaGrupo() {
    
     echo -n "Nome do Grupo a Criar: "

     read NomeGrupo

     echo

     echo "#======= Mensagens do Sistema ========#"

     echo

     smbldap-groupadd -a $NomeGrupo

     echo

     echo "O grupo $NomeGrupo foi criado com sucesso!"

     echo

     echo "Pressione qualquer tecla para continuar..."

     read msg

     Principal

  }

ExcluiGrupo() {

     echo -n "Nome do Grupo a Excluir: "

     read GrupoExclui

     echo

     echo "#======= Mensagens do Sistema =======#"

     echo

     smbldap-groupdel $GrupoExclui

     echo

     echo "O Grupo $GrupoExclui foi excluido com sucesso"

     echo

     echo "Pressione qualquer tecla para continuar..."

     read msg

     Principal

  }

IncluiUserGrupo() {

     echo -n "Login do usuario: "

     read login

     echo

     echo "Nome do grupo: "

     read Grupo

     echo

     echo "#======= Mensagem do Sistema =======#"

     echo

     smbldap-groupmod -m $login $Grupo

     echo

     echo "O login $login foi incluido com sucesso no grupo $Grupo"

     echo

     echo "Pressione qualquer tecla para continuar..."

     read msg

     Principal

  }

ExcluiUserGrupo() {

     echo -n "Login do Usuario: "

     read login

     echo

     echo -n "Grupo: "

     read grupo

     echo

     echo "#======= Mensagem do Sistema =======# "

     echo

     smbldap-groupmod -x $login $grupo

     echo

     echo "O login $login foi excluido com sucesso do grupo $Grupo"

     echo

     echo "Pressione qualquer tecla para continuar... "

     read msg

     Principal

  }

ExibeUserGrupo() {  

     echo -n "Nome do Grupo: "

     read grupo

     echo

     echo "#======= Mensagem do Sistema =======# "

     echo

     smbldap-groupshow $grupo

     echo

     echo "Pressione qualquer tecla para continuar... "

     read msg

     Principal

  }

ExibeGrupoUser() {

     echo -n "Login do Usuario: "

     read login

     echo

     echo "#======= Mensagem do Sistema =======# "

     echo

     id $login

     echo

     echo "Grupos do Login $login exibidos com sucesso! "

     echo

     echo "Pressione qualquer tecla para continuar... "

     read msg

     Principal

  }

InfoUser() {

     echo -n "Login do Usuario: "

     read login

     echo

     echo "#======= Mensagem do Sistema =======# "

     echo

     smbldap-usershow $login

     echo

     echo "Informacoes do $login exibas com sucesso!"

     echo

     echo "Pressione qualquer tecla para continuar..."

     read msg

     Principal

  }

 Principal


