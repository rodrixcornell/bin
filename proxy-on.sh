#!/usr/bin/env bash

echo "Hello World!!!";
echo "Proxy On!!!";

export {https,http,ftp,socks,all}_proxy="http://172.19.10.1:3128/"
export no_proxy="localhost,0.0.0.0,10.0.0.0/8,127.0.0.0/8,192.168.0.0/16"

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
