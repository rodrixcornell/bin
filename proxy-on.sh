#!/usr/bin/env bash

echo "Hello World!!!";
echo "Proxy On!!!";

export {https,http,ftp,socks,all}_proxy="http://172.19.10.1:3128"
#export {https,http,ftp,socks,all}_proxy="http://172.19.5.1:3128/"
export no_proxy="localhost, 0.0.0.0, 10.0.0.0/8, 127.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16, *.manaus.am.gov.br"

git config --global https.proxy "${http_proxy}"
git config --global https.sslVerify false
git config --global http.proxy "${http_proxy}"
git config --global http.sslVerify false

echo -e "Acquire {
\tsocks::proxy \"${http_proxy}\";
\thttps::proxy \"${http_proxy}\";
\thttp::proxy \"${http_proxy}\";
\tftp::proxy \"${http_proxy}\";
}
" | sudo -E tee /etc/apt/apt.conf

echo "# proxy
export no_proxy=\"${no_proxy}\"
export {https,http,ftp,socks,all}_proxy=\"${http_proxy}\"
" | sudo -E tee /etc/profile.d/proxy.sh ; source /etc/profile.d/proxy.sh

source /etc/profile.d/proxy.sh

sudo -E mkdir -p /etc/systemd/system/docker.service.d
echo '[Service]
Environment="HTTP_PROXY='$http_proxy'"
Environment="HTTPS_PROXY='$https_proxy'"
Environment="NO_PROXY='$no_proxy'"
' | sudo -E tee /etc/systemd/system/docker.service.d/http_proxy.conf
sudo -E systemctl daemon-reload
sudo -E systemctl restart docker
# sudo -E systemctl show --property Environment docker
