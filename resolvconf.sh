#!/usr/bin/env bash

echo -e "Resolv Conf\r";

{ \
echo "###
search google.com.br manaus.am.gov.br
###
# Cloudflare
#
nameserver 1.1.1.1
nameserver 1.0.0.1
# nameserver 1.1.1.2
# nameserver 1.0.0.2
# nameserver 1.1.1.3
# nameserver 1.0.0.3
nameserver 2606:4700:4700::1111
nameserver 2606:4700:4700::1111
# nameserver 2606:4700:4700::1112
# nameserver 2606:4700:4700::1002
# nameserver 2606:4700:4700::1113
# nameserver 2606:4700:4700::1003

nameserver 8.8.4.4
nameserver 8.8.8.8
nameserver 9.9.9.9
nameserver 4.4.4.4
nameserver 4.2.2.2
nameserver 84.200.69.80
nameserver 84.200.70.40
nameserver 189.38.95.95
nameserver 189.38.95.96

nameserver 2804:10:10::10
nameserver 2804:10:10::20

###
# Net & Claro
#
#nameserver 181.213.132.2
#nameserver 181.213.132.3
#nameserver 2804:14d:1:0:181:213:132:2
# Too many DNS servers configured, the following entries may be ignored.
#nameserver 2804:14d:1:0:181:213:132:3
"; \
} | sudo -E tee /etc/resolv.conf
