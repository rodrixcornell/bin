#!/bin/bash

#alias apttotal='sudo apt-get update && sudo apt-get -f -y dist-upgrade'
#alias apttualiza='sudo apt-get update && sudo apt-get -f -y upgrade'
#alias aptlimpa='sudo apt-get -y autoremove && sudo apt-get -y autoclean'
#alias apt-f-limpa='sudo rm /var/lib/apt/lists/* ; sudo rm /var/lib/apt/lists/partial/* ; sudo apt-get -f install ; sudo apt-get clean ; sudo apt-get update'
#alias apt-f='sudo apt-get -f install ; sudo apt-get clean ; sudo apt-get update'
#alias add-apt-repository='add-apt-repository -y'
#alias aptpesquisa='sudo apt-cache search'
#alias aptinstall='sudo apt-get install'
#alias aptpurge='sudo apt-get purge'

alias add-apt-repository='add-apt-repository -y'
alias apttotal='sudo apt update && sudo apt full-upgrade'
alias apttualiza='sudo apt update && sudo apt upgrade'
alias aptpesquisa='sudo apt search'
alias aptlimpa='sudo apt-get -y autoremove && sudo apt-get -y autoclean'
alias apt-f-limpa='sudo rm /var/lib/apt/lists/* ; sudo rm /var/lib/apt/lists/partial/* ; sudo apt-get -f install ; sudo apt-get clean ; sudo apt update'
alias apt-f='sudo apt-get -f install ; sudo apt-get clean ; sudo apt update'

#alias nautilusQuit='nautilus -q; nautilus -q'

alias vbox_compact='VBoxManage modifyhd --compact'
alias vbox_set_uuid='VBoxManage internalcommands sethduuid'
alias vbox_setup='sudo /etc/init.d/vboxdrv setup'
alias vbox_convert_raw4vdi='VBoxManage convertfromraw --format VDI'

alias eth0_tcptrack='sudo tcptrack -i eth0 -p'
alias eth1_tcptrack='sudo tcptrack -i eth1 -p'
alias eth2_tcptrack='sudo tcptrack -i eth2 -p'
alias enp2s0_tcptrack='sudo tcptrack -i enp2s0 -p'
alias wlan0_tcptrack='sudo tcptrack -i wlan0 -p'
alias wlan1_tcptrack='sudo tcptrack -i wlan1 -p'
alias wlan2_tcptrack='sudo tcptrack -i wlan2 -p'
alias wlp3s0_tcptrack='sudo tcptrack -i wlp3s0 -p'
alias eth0_iftop='sudo iftop -i eth0 -nPp' #-BFPp
alias eth1_iftop='sudo iftop -i eth1 -nPp'
alias eth2_iftop='sudo iftop -i eth2 -nPp'
alias enp2s0_iftop='sudo iftop -i enp2s0 -nPp'
alias wlan0_iftop='sudo iftop -i wlan0 -nPp'
alias wlan1_iftop='sudo iftop -i wlan1 -nPp'
alias wlan2_iftop='sudo iftop -i wlan2 -nPp'
alias wlp3s0_iftop='sudo iftop -i wlp3s0 -nPp'
alias eth0_speed='speedometer -tx eth0 -rx eth0'
alias eth1_speed='speedometer -tx eth1 -rx eth1'
alias eth2_speed='speedometer -tx eth2 -rx eth2'
alias enp2s0_speed='speedometer -tx enp2s0 -rx enp2s0'
alias wlan0_speed='speedometer -tx wlan0 -rx wlan0'
alias wlan1_speed='speedometer -tx wlan1 -rx wlan1'
alias wlan2_speed='speedometer -tx wlan2 -rx wlan2'
alias wlp3s0_speed='speedometer -tx wlp3s0 -rx wlp3s0'

alias pkill='sudo pkill -9'

#sudo t50 --flood --turbo -S  172.19.10.15 --dport=445
#alias t50='t50 --flood --turbo --dport 80 53 443 12345 -S -s 10.10.0. --protocol TCP '
#alias t50='sudo t50 --flood --turbo -S '
#alias t50='sudo t50 --flood --turbo --dport 80 53 443 12345 -S -s 10.10.0. --protocol TCP '

# PowerXpress options:
#  --px-list-active-gpu
alias ati_pwrXpress='aticonfig --pxl'
#      List current activated GPU
alias ati_on='sudo aticonfig --px-dgpu'
#      Activate discrete GPU (High-Performance mode), must re-start X to take effect
alias ati_off='sudo aticonfig --px-igpu'
#      Activate integrated GPU (Power-Saving mode), must re-start X to take effect
#
# AMD Overdrive (TM) options:
#  --od-gettemperature
alias ati_thermal='aticonfig --odgt'
#      Returns the temperature reported by any thermal sensors available on the adapter.
#
# Multiple display adapter options:
#  --list-adapters
alias ati_adapters='aticonfig --lsa'
#      Lists all detected and supported display adapters. The default adapter (used when --adapter is not specified) will be indicated with a "*" next to it.
#
# ACPI Options:
#  --acpi-services=on|off
#      Enable/disable ACPI services. In the case of BIOS or kernel ACPI issues, ACPI services in the driver can be disabled through this option. The ACPI services are enabled by default.
#  --acpi-display-switch=on|off
#      Enable/disable display switching with ACPI methods on mobile platforms. This option is enabled by default.
alias thermal-ati='echo; sensors; hddtemp /dev/sda; echo; aticonfig --odgt'
alias thermal2='echo; sensors; hddtemp /dev/sda; hddtemp /dev/sdb; echo'
alias thermal='echo; sensors; hddtemp /dev/sda; echo'
alias nano='nano -cimwT 4'
alias nano_su='sudo nano -cimwT 4'
alias find_su='sudo find'
alias mousepad_su='sudo mousepad'

alias hell_halt='sudo init 0'
alias hell_reboot='sudo init 6'
alias desligar='sudo halt'
alias reiniciar='sudo reboot'

#alias ll='clear && ls -alhF'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'
alias mv_su='sudo mv -fvu'
alias cp_su='sudo cp -rfvu'
alias rm_su='sudo rm -drfv'
alias mkdir_su='sudo mkdir -p'
alias mv='mv -fvu'
alias cp='cp -rfvu'
alias rm='rm -drfv'
alias mvB='mv -fB'
alias cpB='cp -rfB'
alias rmB='rm -rfB'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='sudo du -k -h --max-depth=1'
alias free='free -tlm'
alias catn='cat -n'
alias ln='ln -sfv'
alias mount='mount | column -t'

alias wget='wget -c -t0'
alias wget-limit='wget -c --limit-rate=15000'
alias wget-site='wget -r -erobots=off'
alias wget-list='wget -i'
alias curl-v='curl -v '
alias curl-i='curl -i '

alias grep='grep -y --color=auto'
alias canal='gksu software-properties-gtk'
alias lshw-gtk='gksu lshw-gtk'
alias hoje='date "+%Y/%m/%d - %H:%M:%S.%N"'
alias agora='date "+%Y%m%d-%H%M%S-%N"'

alias alien-deb='sudo alien --scripts --to-deb'
#; sudo chown 1000:1000 *deb'
alias alien-rpm='sudo alien --scripts --to-rpm'
#; sudo chown 1000:1000 *rpm'

#alias gkedit='sudo gedit'
alias griVe='grive -VP -l ~/.grive-last-sync.log'
alias grive-f='grive -fVP -l ~/.grive-last-sync.log'
alias grive-dry='grive --dry-run -l ~/.grive-last-sync.log'
alias grive-n='grive -nVP -l ~/.grive-last-sync.log'
alias grive-u='grive -uVP -l ~/.grive-last-sync.log'

###############################################################################
### Git
alias g=git
alias gk=gitk
alias gitkraken='gitkraken -np . '
#alias pull_push='git pull; git push'
#complete -o bashdefault -o default -o nospace -F _git

alias sublime='subl -np . '
alias mscode='code --log debug --disable-gpu -nra . '
alias vscode='code --log debug --disable-gpu -nra . '

alias rar_m5='rar a -m5 -idp -y'
alias chromium-browser-proxy='chromium-browser --proxy-server='$(echo $http_proxy | sed 's/http:\/\///;s/\///')
alias chrome-beta-incognito-proxy='google-chrome-beta --incognito --proxy-server="http=172.19.10.1:3128"'
alias chrome-beta-proxy='google-chrome-beta --proxy-server="http=172.19.10.1:3128"'
alias youtube-dl-proxy='youtube-dl --proxy "http://172.19.10.20:3128/"'
alias youtube-dl-list='youtube-dl -a'

alias rman='rlwrap rman'

#alias php='php -elsw'
alias php-web-server='php -elswS localhost:8000'
alias php-web-server_su='sudo php -elswS 0.0.0.0:80'

alias mysql-start='sudo service mysql start'
alias mysql-stop='sudo service mysql stop'

alias nmap_su='sudo nmap -A -vvvvv -sS -O'

#alias public_semad='cd public_html/semad/'
alias if.me='ifconfig | grep -i bcast | cut -d" " -f13'

alias ifconfig.me='curl ifconfig.me'
alias ifconfig.me-all='curl ifconfig.me/all'
alias ifconfig.co='curl ifconfig.co'
alias ipecho.net='curl ipecho.net/plain; echo'
alias icanhazip.com='curl icanhazip.com'
alias ident.me='curl ident.me'
#curl v4.ident.me
#curl v6.ident.me
alias ip='ip -c'

# Previsão do tempo
# curl wttr.in/:help
alias tempo='curl -4 http://wttr.in/manaus?lang=pt'

# Composer
#alias composer='composer --prefer-dist -vvv --profile'
alias composer='composer -vvv --profile'

# Laravel
alias artisan='artisan -vvv'

# KillAll
alias kill_fox='killall firefox'
alias kill_notes='killall xfce4-notes'
alias kill_dropbox='killall dropbox'

