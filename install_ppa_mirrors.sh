#!/bin/bash

####
echo 'Sources List Ubuntu 12.04 LTS _Precise Pangolin_'

if [ ! -e /etc/apt/sources.list.bkp ] ; then
	sudo cp /etc/apt/sources.list /etc/apt/sources.list.bkp
fi

sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main restricted universe multiverse" > /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-backports main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-proposed restricted main multiverse universe" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main/debian-installer restricted/debian-installer universe/debian-installer multiverse/debian-installer" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main/debian-installer restricted/debian-installer universe/debian-installer multiverse/debian-installer" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-backports main/debian-installer restricted/debian-installer universe/debian-installer multiverse/debian-installer" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-security main/debian-installer restricted/debian-installer universe/debian-installer multiverse/debian-installer" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-proposed main/debian-installer restricted/debian-installer universe/debian-installer multiverse/debian-installer" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-backports main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-proposed restricted main multiverse universe" >> /etc/apt/sources.list'

####
echo 'Extras Ubuntu'

sudo sh -c 'echo "deb http://extras.ubuntu.com/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/extras.ubuntu.list'
sudo sh -c 'echo "deb-src http://extras.ubuntu.com/ubuntu $(lsb_release -sc) main" >> /etc/apt/sources.list.d/extras.ubuntu.list'

####
echo 'Canonical Partner'

sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner" > /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-updates partner" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-backports partner" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-security partner" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-proposed partner" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner/debian-installer" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-updates partner/debian-installer" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-backports partner/debian-installer" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-security partner/debian-installer" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-proposed partner/debian-installer" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu $(lsb_release -sc) partner" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu $(lsb_release -sc)-updates partner" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu $(lsb_release -sc)-backports partner" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu $(lsb_release -sc)-security partner" >> /etc/apt/sources.list.d/canonical_partner.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu $(lsb_release -sc)-proposed partner" >> /etc/apt/sources.list.d/canonical_partner.list'

###
sudo aptitude install -y nautilus-open-terminal terminator

####
echo 'Ding Zhou - Ubuntu Tweak Stable PPA'
sudo add-apt-repository -y ppa:tualatrix/ppa

####
echo 'YannUbuntu - Boot-Repair'
sudo add-apt-repository -y ppa:yannubuntu/boot-repair

####
echo 'CPU-G Developers - builds PPA'
sudo add-apt-repository -y ppa:cpug-devs/ppa

####
echo 'Sergey Shnatsel Davidoff - zRam stuff'
sudo add-apt-repository -y ppa:shnatsel/zram

####
echo 'T. Scott Barnes - Indicator for Lock Keys'
echo 'T. Scott Barnes - PPA named indicator-keylock-daily for T. Scott Barnes'
sudo add-apt-repository -y ppa:tsbarnes/indicator-keylock
sudo add-apt-repository -y ppa:tsbarnes/indicator-keylock-daily

####
echo 'Florian Diesch - testing'
sudo add-apt-repository -y ppa:diesch/testing

####
echo 'Alin Andrei - WebUpd8'
sudo add-apt-repository -y ppa:nilarimogard/webupd8

####
echo 'WebUpd8 - Jupiter'
sudo add-apt-repository -y ppa:webupd8team/jupiter

####
echo 'WebUpd8 - Brackets'
sudo add-apt-repository -y ppa:webupd8team/brackets

####
echo 'WebUpd8 - Oracle Java (JDK) 6 / 7 / 8 install -yer PPA'
sudo add-apt-repository -y ppa:webupd8team/java

####
echo 'WebUpd8 - Y PPA Manager'
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager

####
echo 'WebUpd8 - VLMC Daily Builds PPA'
sudo add-apt-repository -y ppa:webupd8team/vlmc

####
echo 'WebUpd8 - Sublime Text 2'
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2

####
echo 'LibreOffice Packaging - LibreOffice PPA'
sudo add-apt-repository -y ppa:libreoffice/ppa

####
echo 'Ubuntu Mozilla Daily Build Team - Firefox and Thunderbird daily builds'
sudo add-apt-repository -y ppa:ubuntu-mozilla-daily/ppa

####
echo 'Ubuntu Mozilla Security Team - PPA for Ubuntu Mozilla Security Team'
sudo add-apt-repository -y ppa:ubuntu-mozilla-security/ppa

####
echo 'Ubuntu Wine Team - Wine Team PPA'
sudo add-apt-repository -y ppa:ubuntu-wine/ppa

####
echo 'Ubuntu-X - X Updates'
sudo add-apt-repository -y ppa:ubuntu-x-swat/x-updates

####
echo 'BackBox Linux v3 - Precise'
sudo add-apt-repository -y ppa:backbox/four #v4 - trusty
#sudo add-apt-repository -y ppa:backbox/three #v3 - precise
#sudo add-apt-repository -y ppa:backbox/two #v2 - natty
#sudo add-apt-repository -y ppa:backbox/one #v1 - lucid

####
echo 'Bernd Kreuss - fpc, lazarus'
sudo add-apt-repository -y ppa:prof7bit/fpc-2.6.0
sudo add-apt-repository -y ppa:prof7bit/fpc-2.6-latest
sudo add-apt-repository -y ppa:prof7bit/lazarus-1.0.0
sudo add-apt-repository -y ppa:prof7bit/lazarus-1.0-latest

####
echo 'MariaDB'
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo sh -c 'echo "deb http://ftp.ddg.lth.se/mariadb/repo/5.5/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/mariadb.list'
sudo sh -c 'echo "deb-src http://ftp.ddg.lth.se/mariadb/repo/5.5/ubuntu $(lsb_release -sc) main" >> /etc/apt/sources.list.d/mariadb.list'

####
echo 'Installing Google Chrome'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list'
sudo sh -c 'echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

####
echo 'Installing Zend Server'
wget http://repos.zend.com/zend.key -O- | sudo apt-key add -

sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/deb server non-free" > /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.1/deb server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.1/deb_ssl1.0 server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.2/deb server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.2/deb_ssl1.0 server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.3/deb server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.3/deb_ssl1.0 server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.3/deb_apache2.4 server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/7.0/deb server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/7.0/deb_ssl1.0 server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/7.0/deb_apache2.4 server non-free" >> /etc/apt/sources.list.d/zend.list'
#sudo add-apt-repository "deb http://repos.zend.com/zend-server/deb server non-free"

### zend framework
#sudo echo "export ZEND_PATH=/usr/local/zend" > /etc/profile.d/zend.sh
#sudo echo "export PATH=$PATH:/usr/local/zend/bin:/usr/local/zend/share/ZendFramework/bin:/usr/local/zend/apache2/bin" >> /etc/profile.d/zend.sh
#sudo echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/zend/lib" >> /etc/profile.d/zend.sh

#sudo mkdir /etc/skel/public_html
#sudo a2enmod userdir
#sudo service apache2 restart
#sudo gedit /usr/local/zend/etc/php.ini
#sudo touch /etc/mysql/my.cnf

####
echo 'DropBox - https://www.dropbox.com/install?os=lnx'
cd ~/Downloads/
#wget -c https://linux.dropbox.com/packages/debian/dropbox_1.6.1_i386.deb; sudo dpkg -i dropbox_1.6.1_i386.deb

####
echo 'Copy - https://www.copy.com/install/'

#wget -c https://copy.com/install/linux/Copy.tgz -O- | tar xzvf -
cd ~/Downloads/
#wget -c https://copy.com/install/linux/Copy.tgz; tar xzvf Copy.tgz; sudo mv copy /opt/; cd /opt/copy/; sudo rm -rfv x86_64/; x86/./CopyAgent &

####
echo 'VirtualBox - https://www.virtualbox.org/'

cd ~/Downloads/
#wget -c http://download.virtualbox.org/virtualbox/4.3.8/virtualbox-4.3_4.3.8-92456~Ubuntu~precise_i386.deb; sudo dpkg -i virtualbox-4.3_4.3.8-92456~Ubuntu~precise_i386.deb

wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) non-free contrib" > /etc/apt/sources.list.d/virtualbox.list'

####
echo 'GetDeb Software Portal - http://www.getdeb.net/'
cd ~/Downloads/
#wget -q http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb

wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu $(lsb_release -sc)-getdeb apps" > /etc/apt/sources.list.d/getdeb.list'
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu $(lsb_release -sc)-getdeb games" >> /etc/apt/sources.list.d/getdeb.list'

#sudo apt-get install -y gnome-session-fallback gnome-system-tools ghex glade geany geany-plugins midori wallch alacarte fbreader acroread ejecter gdebi ripperx easytag audacious audacity easymp3gain-gtk vlc subdownloader cheese skype pidgin chmsee synapse synaptic filezilla inkscape agave dia gimp deluge bleachbit xchat trimage flashplugin-installer dconf-tools ubuntu-restricted-extras ubuntu-wallpapers* zsnes

#sudo aptitude install -y tuxguitar tuxpaint tuxtype tuxmath

### fazer um script de backup desta pasta
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop

####
echo 'Makson96 - fglrx'
sudo add-apt-repository -y ppa:makson96/fglrx
