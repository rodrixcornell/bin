#!/bin/bash

alias apttotal='sudo apt-get update && sudo apt-get -f -y dist-upgrade'
alias apttualiza='sudo apt-get update && sudo apt-get -f -y upgrade'
alias aptlimpa='sudo apt-get -y autoremove && sudo apt-get -y autoclean'
alias apt-f-limpa='sudo rm /var/lib/apt/lists/* ; sudo rm /var/lib/apt/lists/partial/* ; sudo apt-get -f install ; sudo apt-get clean ; sudo apt-get update'
alias apt-f='sudo apt-get -f install ; sudo apt-get clean ; sudo apt-get update'

alias vbox_setup='sudo /etc/init.d/vboxdrv setup'
alias eth0_tcptrack='sudo tcptrack -i eth0'
alias eth0_iftop='sudo iftop -i eth0 -nPp'
alias eth0_speedometer='speedometer -tx eth0 -rx eth0'
alias pkill='sudo pkill -9'
#alias t50='sudo t50 --flood --turbo -S '
#alias t50='sudo t50 --flood --turbo --dport 80 53 443 12345 -S -s 10.10.0. --protocol TCP '

alias vbox_compact='VBoxManage modifyhd --compact'
alias vbox_set_uuid='VBoxManage internalcommands sethduuid'

alias nano='nano -c'
alias nano_su='sudo nano'
#alias g=git
#alias gk=gitk

alias hell_halt='sudo init 0'
alias hell_reboot='sudo init 6'
alias desligar='sudo halt'
alias reiniciar='sudo reboot'

#alias ll='clear && ls -alhF'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'
alias mv_su='sudo mv -fv'
alias cp_su='sudo cp -rfv'
alias rm_su='sudo rm -rfv'
alias mv='mv -fB'
alias cp='cp -rfB'
alias rm='rm -rfB'
alias df='df -h'
alias du='du -k -h --max-depth=1'
alias free='free -tlm'
alias cat='cat -n'
alias ln='ln -fv'
alias mount='mount | column -t'
alias wget='wget -c -t0'
alias wget-limit='wget -c --limit-rate=15000'
alias wget-site='wget -r -erobots=off'
alias canal='gksu software-properties-gtk'
alias lshw-gtk='gksu lshw-gtk'

alias alien-deb='sudo alien -dc; sudo chown 1000:1000 *deb'
alias alien-rpm='sudo alien -rc; sudo chown 1000:1000 *rpm'

#alias gkedit='sudo gedit'
alias griVe='grive -V'
alias kill_fox='killall firefox'

alias sqlplus='rlwrap sqlplus'

alias rar_m5='rar a -m5 -idp -y'
alias chrome-beta-incognito='google-chrome-beta --incognito --proxy-server="http=172.19.10.5:3128;https=172.19.10.5:3128"'
alias chrome-beta='google-chrome-beta --proxy-server="http=172.19.10.5:3128;https=172.19.10.5:3128"'