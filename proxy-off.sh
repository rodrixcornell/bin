#!/usr/bin/env bash

echo "Hello World!!!";
echo "Proxy Off!!!";

export no_proxy="localhost,10.0.0.0/8,127.0.0.0/8,172.16.0.0/12,192.168.0.0/16,169.254.0.0/16,*.dsis-1265071,*.pmm,*.manaus.am.gov.br"
export {https,http,ftp,socks,all}_proxy=""
unset {https,http,ftp,socks,all,no}_proxy

git config --global --unset https.proxy
git config --global --unset https.sslVerify
git config --global --unset http.proxy
git config --global --unset http.sslVerify

sudo -E rm -rf /etc/apt/apt.conf

sudo -E rm -rf /etc/profile.d/proxy.sh

sudo -E rm -rf /etc/systemd/system/docker.service.d
sudo -E systemctl daemon-reload
sudo -E systemctl restart docker
# sudo -E systemctl show --property Environment docker


echo -e "write-out=\\\n" | tee ~/.curlrc

echo -e "continue = on
tries = 0
server-response = on
localencoding = UTF-8
remoteencoding = UTF-8" | tee ~/.wgetrc

npm config delete https-proxy
npm config delete http-proxy
npm config delete ftp-proxy
npm config delete proxy
cat ~/.npmrc