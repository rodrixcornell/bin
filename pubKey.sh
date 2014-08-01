#!/bin/bash

echo "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main #Dropbox Linux" | sudo tee /etc/apt/sources.list.d/dropbox.list
#linux.dropbox.com lucid: FC918B335044912E
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E

echo "deb http://dl.google.com/linux/chrome/deb/ stable main #Google Chrome" | sudo tee /etc/apt/sources.list.d/google-chrome.list
echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main #Google Talkplugin" | sudo tee /etc/apt/sources.list.d/google-talkplugin.list
#dl.google.com stable: A040830F7FAC5991
wget -q -O- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

echo "deb http://www.openprinting.org/download/printdriver/debian/ lsb3.2 main #OpenPrinting" | sudo tee /etc/apt/sources.list.d/openprinting.list
#www.openprinting.org lsb3.2: 7A4B44C2D2A2203E
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys D2A2203E

#echo "deb http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/nilarimogard-webupd.list

sudo add-apt-repository ppa:nilarimogard/webupd8

#echo "deb http://ppa.launchpad.net/rye/ubuntuone-extras/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/rye-ubuntuone-extras.list

sudo add-apt-repository ppa:rye/ubuntuone-extras

#echo "deb http://ppa.launchpad.net/tsbarnes/indicator-keylock/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/tsbarnes-indicator-keylock.list

sudo add-apt-repository ppa:tsbarnes/indicator-keylock

#echo "deb http://ppa.launchpad.net/tualatrix/ppa/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/tualatrix-ppa.list

sudo add-apt-repository ppa:tualatrix/ppa

#echo "deb http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/ubuntu-mozilla-security-ppa.list

sudo add-apt-repository ppa:ubuntu-mozilla-daily/ppa
sudo add-apt-repository ppa:ubuntu-mozilla-security/ppa
#sudo add-apt-repository ppa:mozillateam/firefox-stable
#sudo add-apt-repository ppa:mozillateam/thunderbird-stable

#echo "deb http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/ubuntu-wine-ppa.list

sudo add-apt-repository ppa:ubuntu-wine/ppa

echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib non-free #VirtualBox Oracle" | sudo tee /etc/apt/sources.list.d/virtualbox.list
#download.virtualbox.org lucid: 54422A4B98AB5139
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

#echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/webupd8team-java.list

sudo add-apt-repository ppa:webupd8team/java

#echo "deb http://ppa.launchpad.net/webupd8team/y-ppa-manager/ubuntu $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/webupd8team-y-ppa-manager.list

echo "deb http://repos.zend.com/zend-server/deb server non-free #Zend Server" | sudo tee /etc/apt/sources.list.d/zend.list
#repos.zend.com server: 2EAE1437F7D2C623
wget -q http://repos.zend.com/zend.key -O- | sudo apt-key add -

#sudo add-apt-repository ppa:videolan/master-daily
#sudo add-apt-repository ppa:videolan/stable-daily

sudo add-apt-repository ppa:pidgin-developers/ppa

#ppa.launchpad.net lucid: 531EE72F4C9D234C
#ppa.launchpad.net lucid: 88DB8FC6C190F85D
#ppa.launchpad.net lucid: 7384429D471E4486
#ppa.launchpad.net lucid: 6AF0E1940624A220
#ppa.launchpad.net lucid: A6DCF7707EBC211F
#ppa.launchpad.net lucid: 5A9A06AEF9CB8DB0
#ppa.launchpad.net lucid: C2518248EEA14886

