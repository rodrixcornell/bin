#!/bin/bash
# script para ativar o apt via proxy "aptviaproxy"
# Defina previamente as variáveis
# ou exiba uma mensagem para o usuário digitar os dados
#
# serão editados três arquivos
# /etc/profile
# /etc/bashrc
# /etc/apt/apt.conf
# /etc/environment

clear
echo " "
echo "==========================================="
echo   Script para configuração do apt via proxy
echo "==========================================="
echo 

# testa se o root está executando o script
if [ ! $USER = "root" ]; then
   echo "   Este script deve ser executado como root"
   read -p  "   Você sabe a senha de root? [S/n] " resp
   
    resp=$(echo $resp | tr [[:upper:]] [[:lower:]] | cut -c1)
    if [ "$resp" != "s" ]; then
      echo "  saindo do script, pois você é um rélis mortal"
      sleep 1
      exit
    fi
     
    clear
    echo "   Digite então a senha de root"
    sleep 1
    clear
    su  
fi

if cat /etc/profile | grep "(http_proxy|ftp_proxy)" > /dev/null; then
   echo "   O proxy já está configurado em /etc/profile"
   echo "   Os valores são: "
   echo
   cat /etc/profile | grep "(http_proxy|ftp_proxy)" | grep -v "export"
   echo 
   sleep 3
   

   read -p "   Deseja atualizar a lista de pacotes? [N/s] " resp
   resp=$(echo "$resp" | tr [[:upper:]] [[:lower:]] | cut -c1)
   if [ "$resp" = "s" ]; then
	   echo "   Atualizando os repositórios"
	   sleep 1
       apt-get update

   fi
fi


# as linhas abaixo pegam os dados necessários para configurar o seu proxy
echo
read -p "   O proxy necessita usuário e senha?  [s/N] " proxysenha
proxysenha=$(echo $proxysenha | tr [[:upper:]] [[:lower:]] | cut -c1)

   if [ "$proxysenha" = "s"]; then
     read -p "   Digite o nome do usuário para o proxy: " usuario
     read -p "   Digite a senha para o proxy: " senha
   fi

   read -p "   Digite o ip do servidor proxy: " ip_servidor
   read -p "   Digite a porta do proxy: " porta
   echo

   if [ "$proxysenha" = "s"]; then
      PROXY="${usuario}:${senha}@${ip_servidor}:${porta}"
   else
      PROXY="${ip_servidor}:${porta}"
   fi


# configuração do /etc/profile
cat <<-EOF >> /etc/profile

http_proxy="http://${PROXY}"
ftp_proxy="http://${PROXY}"
export http_proxy ftp_proxy
EOF

# configuração do /etc/apt/apt.conf
cat <<-EOF >>  /etc/apt/apt.conf

Acquire {
HTTP::PROXY=${PROXY};
FTP::PROXY=${PROXY};
}
EOF


# Configuração do /etc/environment
cat <<-EOF >> /etc/environment

http_proxy="http://${PROXY}"
ftp_proxy="http://${PROXY}"

Acquire {
HTTP::PROXY=${PROXY};
FTP::PROXY=${PROXY};
}

alias wget="wget -Y on"

EOF

## se o proxy tiver senha o wget tem que ter senha também
if [ "$proxysenha" = "s"]; then
# configuração do wget
cat <<-EOF >> /etc/bashrc


alias wget="wget --proxy-user=${usuario} --proxy-passwd=${senha}"
EOF

fi

echo
echo "   1 - Feche o konsole atual"
echo "   2 - Abra um novo terminal e
echo "   3 - Rode o apt-get update como root"
echo
sleep 2
exit
