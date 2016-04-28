#!/bin/bash

function semad-proxy() {
    export no_proxy="localhost, 127.0.0.0/8, 10.0.0.0/8, 192.168.0.0/16, 172.16.0.0/12, 172.19.10.0/23, manaus.am.gov.br, .manaus.am.gov.br"

    if (( $# > 0 )); then
        #valid=$(echo $@ | sed -n 's/\([0-9]\{1,3\}.\)\{4\}:\([0-9]\+\)/&/p')
        #if [[ $valid != $@ ]]; then
        #    >&2 echo "Invalid address"
        #    return 1
        #fi

        export http_proxy="http://$1:$2"
        export https_proxy=$http_proxy
        export ftp_proxy=$http_proxy
        export rsync_proxy=$http_proxy
        export all_proxy=$http_proxy
        echo "Proxy environment variable set."
        #return 0
    fi

    if [ -n  "$http_proxy" ]; then
 export HTTP_PROXY=$http_proxy
 export HTTPS_PROXY=$http_proxy
 export FTP_PROXY=$http_proxy
 export RSYNC_PROXY=$http_proxy
        export ALL_PROXY=$http_proxy

        echo -e "Para configurar o apt.conf digite a senha do root:"
        su -l root -c "echo '
        Acquire{
   HTTP::proxy \"$http_proxy\";
   HTTPS::proxy \"$http_proxy\";
   FTP::proxy \"$http_proxy\";
        }' > /etc/apt/apt.conf"
        echo -e "Proxy apt.conf setado com sucesso."

 return 0
   fi
}

function semad-proxy-off(){
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy
    unset all_proxy
    unset HTTP_PROXY
    unset HTTPS_PROXY
    unset FTP_PROXY
    unset RSYNC_PROXY
    unset ALL_PROXY
    # O menos '-a' é quando você não quiser setar o apt.conf
    echo -e "Para remover o apt.conf digite a senha do root:"
    if [ -n $1 ]; then
      su -l root -c  "echo '' > /etc/apt/apt.conf"
      echo -e "Proxy environment variable and apt.conf removed."
    else
      echo -e "Proxy environment variable removed."
    fi
}
