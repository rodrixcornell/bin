#!/bin/bash

echo "deb http://linux.dropbox.com/ubuntu $(lsb_release -sc) main #Dropbox Linux" | sudo tee /etc/apt/sources.list.d/dropbox.list
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E

echo "deb http://dl.google.com/linux/chrome/deb/ stable main #Google Chrome" | sudo tee /etc/apt/sources.list.d/google-chrome.list
echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main #Google Talkplugin" | sudo tee /etc/apt/sources.list.d/google-talkplugin.list
wget -q -O- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

echo "deb http://www.openprinting.org/download/printdriver/debian/ lsb3.2 main #OpenPrinting" | sudo tee /etc/apt/sources.list.d/openprinting.list
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys D2A2203E

echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib non-free #VirtualBox Oracle" | sudo tee /etc/apt/sources.list.d/virtualbox.list
#download.virtualbox.org lucid: 54422A4B98AB5139
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

echo "deb http://repos.zend.com/zend-server/deb server non-free #Zend Server" | sudo tee /etc/apt/sources.list.d/zend.list
#repos.zend.com server: 2EAE1437F7D2C623
wget -q http://repos.zend.com/zend.key -O- | sudo apt-key add -

################################################################################
#sudo add-apt-repository ppa:mozillateam/firefox-stable
#sudo add-apt-repository ppa:mozillateam/thunderbird-stable
#sudo add-apt-repository ppa:videolan/master-daily
#sudo add-apt-repository ppa:videolan/stable-daily

echo "########################################"
arrayPPA=( "ppa:nilarimogard/webupd8" "ppa:rye/ubuntuone-extras" "ppa:tsbarnes/indicator-keylock" "ppa:tualatrix/ppa" "ppa:ubuntu-mozilla-daily/ppa" "ppa:ubuntu-mozilla-security/ppa" "ppa:ubuntu-wine/ppa" "ppa:webupd8team/java" "ppa:pidgin-developers/ppa" );
x=0;
echo "########################################"
while [ $x != ${#arrayPPA[@]} ]
do
	echo "Prepositório "${arrayPPA[$x]}" único digito"
	sudo add-apt-repository ${arrayPPA[$x]}
	echo ""
	let "x = x +1"
done
