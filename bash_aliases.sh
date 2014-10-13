#!/bin/bash

alias apttotal='sudo apt-get update && sudo apt-get -f -y dist-upgrade'
alias apttualiza='sudo apt-get update && sudo apt-get -f -y upgrade'
alias aptlimpa='sudo apt-get -y autoremove && sudo apt-get -y autoclean'
alias apt-f-limpa='sudo rm /var/lib/apt/lists/* ; sudo rm /var/lib/apt/lists/partial/* ; sudo apt-get -f install ; sudo apt-get clean ; sudo apt-get update'
alias apt-f='sudo apt-get -f install ; sudo apt-get clean ; sudo apt-get update'
alias add-apt-repository='add-apt-repository -y'
alias aptpesquisa='sudo apt-cache search'
#alias nautilusQuit='nautilus -q; nautilus -q'

alias vbox_compact='VBoxManage modifyhd --compact'
alias vbox_set_uuid='VBoxManage internalcommands sethduuid'
alias vbox_setup='sudo /etc/init.d/vboxdrv setup'

alias eth0_tcptrack='sudo tcptrack -i eth0'
#alias eth2_tcptrack='sudo tcptrack -i eth2'
alias wlan0_tcptrack='sudo tcptrack -i wlan0'
alias eth0_iftop='sudo iftop -i eth0 -nPp'
#alias eth2_iftop='sudo iftop -i eth2 -nPp'
alias wlan0_iftop='sudo iftop -i wlan0 -nPp'
alias eth0_speed='speedometer -tx eth0 -rx eth0'
#alias eth2_speed='speedometer -tx eth2 -rx eth2'
alias wlan0_speed='speedometer -tx wlan0 -rx wlan0'

alias pkill='sudo pkill -9'

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
alias thermal2='echo; sensors; echo; hddtemp /dev/sda; echo; aticonfig --odgt'
alias thermal='echo; sensors; echo; hddtemp /dev/sda; echo'
alias nano='nano -c'
alias nano_su='sudo nano'
alias find_su='sudo find'

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
alias wget-list='wget -i'
alias canal='gksu software-properties-gtk'
alias lshw-gtk='gksu lshw-gtk'

alias alien-deb='sudo alien -dc; sudo chown 1000:1000 *deb'
alias alien-rpm='sudo alien -rc; sudo chown 1000:1000 *rpm'

#alias gkedit='sudo gedit'
alias griVe='grive -V'
alias grive-f='grive -f'
alias grive-dry='grive --dry-run'
###############################################################################
### Git
alias g=git
alias gk=gitk
#complete -o bashdefault -o default -o nospace -F _git

alias kill_fox='killall firefox'

alias sqlplus='rlwrap sqlplus'

alias rar_m5='rar a -m5 -idp -y'
alias chrome-beta-incognito='google-chrome-beta --incognito --proxy-server="http=172.19.10.20:3128;https=172.19.10.20:3128"'
alias chrome-beta='google-chrome-beta --proxy-server="http=172.19.10.20:3128;https=172.19.10.20:3128"'
alias youtube-dl-proxy='youtube-dl --proxy "http://172.19.10.20:3128/"'
alias youtube-dl-list='youtube-dl -a'