#!/bin/bash

mkdir /tmp/downloads
cd /tmp/downloads

####
echo 'Sources List $(lsb_release -ds) _Precise Pangolin_'

if [ ! -e /etc/apt/sources.list.bkp ] ; then
	sudo cp /etc/apt/sources.list /etc/apt/sources.list.bkp
fi

sudo sh -c 'echo "#Sources List $(lsb_release -ds)" > /etc/apt/sources.list'
sudo sh -c 'echo "deb http://artfiles.org/ubuntu.com/  $(lsb_release -sc) main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-backports main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-proposed restricted main multiverse universe" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-backports main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-proposed restricted main multiverse universe" >> /etc/apt/sources.list'

####
echo 'Extras Ubuntu'

sudo sh -c 'echo "deb http://extras.ubuntu.com/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/extras.list'
sudo sh -c 'echo "deb-src http://extras.ubuntu.com/ubuntu $(lsb_release -sc) main" >> /etc/apt/sources.list.d/extras.list'

####
echo 'Canonical Partner'

sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner" > /etc/apt/sources.list.d/canonical.partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-updates partner" >> /etc/apt/sources.list.d/canonical.partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-backports partner" >> /etc/apt/sources.list.d/canonical.partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-security partner" >> /etc/apt/sources.list.d/canonical.partner.list'
sudo sh -c 'echo "deb http://archive.canonical.com/ubuntu $(lsb_release -sc)-proposed partner" >> /etc/apt/sources.list.d/canonical.partner.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu $(lsb_release -sc) partner" >> /etc/apt/sources.list.d/canonical.partner.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu $(lsb_release -sc)-updates partner" >> /etc/apt/sources.list.d/canonical.partner.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu $(lsb_release -sc)-backports partner" >> /etc/apt/sources.list.d/canonical.partner.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu $(lsb_release -sc)-security partner" >> /etc/apt/sources.list.d/canonical.partner.list'
sudo sh -c 'echo "deb-src http://archive.canonical.com/ubuntu $(lsb_release -sc)-proposed partner" >> /etc/apt/sources.list.d/canonical.partner.list'

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f -y dist-upgrade #; sudo apt-get -f install -y aptitude

####
echo 'Makson96 - fglrx'
sudo add-apt-repository -y ppa:makson96/fglrx
sudo apt-get update; sudo apt-get -f -y install fglrx-legacy fglrx-legacy-dev

#jockey-gtk

###
sudo apt-get install -y nautilus-open-terminal terminator

sudo apt-get install -y terminator preload hardinfo gkrellm lm-sensors i2c-tools hddtemp htop iftop iotop tcptrack speedometer curl nmap p7zip-full p7zip-rar rar dpkg-repack gpart gparted gufw tasksel vsftpd xclip mpg321 lame ntfs-3g

####
echo 'Ding Zhou - Ubuntu Tweak Stable PPA'
sudo add-apt-repository -y ppa:tualatrix/ppa

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y ubuntu-tweak compizconfig-settings-manager #myunity

####
echo 'atareao-team - atareao-team'
sudo add-apt-repository -y ppa:atareao/atareao
#sudo add-apt-repository -y ppa:atareao/indicators

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y

####
echo 'YannUbuntu - Boot-Repair'
sudo add-apt-repository -y ppa:yannubuntu/boot-repair

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y boot-repair

####
echo 'CPU-G Developers - builds PPA'
sudo add-apt-repository -y ppa:cpug-devs/ppa

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y cpu-g

####
echo 'Sergey Shnatsel Davidoff - zRam stuff'
sudo add-apt-repository -y ppa:shnatsel/zram

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y zram-config

####
echo 'System Load Indicator stable daily builds'
sudo add-apt-repository -y ppa:indicator-multiload/stable-daily

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y indicator-multiload

####
echo 'Caffeine Developers team - Caffeine'
#sudo add-apt-repository -y ppa:caffeine-developers/ppa

#sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y caffeine

####
echo 'T. Scott Barnes - Indicator for Lock Keys'
echo 'T. Scott Barnes - PPA named indicator-keylock-daily for T. Scott Barnes'
sudo add-apt-repository -y ppa:tsbarnes/indicator-keylock
sudo add-apt-repository -y ppa:tsbarnes/indicator-keylock-daily

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y indicator-keylock indicator-keylock-humanity

####
echo 'Florian Diesch - testing'
sudo add-apt-repository -y ppa:diesch/testing

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y classicmenu-indicator unsettings

####
echo 'bilgee0629 - wildguppy'
#sudo add-apt-repository -y ppa:fantasyleague0629/wildguppy

#sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y wildguppy

#sudo wget https://www.dropbox.com/s/bcnzhxv6mrmipdd/wildguppy-gtk.desktop -O /etc/xdg/autostart/wildguppy-gtk.desktop

####
echo 'Alin Andrei - WebUpd8'
sudo add-apt-repository -y ppa:nilarimogard/webupd8

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y audacious audacious-plugins grive pidgin-indicator pulseaudio-equalizer unity-reboot youtube-dl*

####
echo 'WebUpd8 - Jupiter'
#sudo add-apt-repository -y ppa:webupd8team/jupiter

#sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y jupiter

####
echo 'WebUpd8 - Brackets'
sudo add-apt-repository -y ppa:webupd8team/brackets

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y brackets

####
echo 'WebUpd8 - Oracle Java (JDK) 6 / 7 / 8 install -yer PPA'
sudo add-apt-repository -y ppa:webupd8team/java

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y oracle-java7-installer oracle-java7-set-default oracle-jdk7-installer

####
echo 'WebUpd8 - Y PPA Manager'
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y y-ppa-manager ppa-purge

####
echo 'WebUpd8 - VLMC Daily Builds PPA'
sudo add-apt-repository -y ppa:webupd8team/vlmc

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y vlmc

####
echo 'WebUpd8 - Unreleased / Git / Backports'
sudo add-apt-repository -y ppa:webupd8team/unstable

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y guake audacious audacious-plugins synaptic

####
echo 'WebUpd8 - Sublime Text 3 installer'
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y #sublime-text-installer

####
echo 'WebUpd8 - Sublime Text 2'
sudo add-apt-repository -y ppa:webupd8team/sublime-text-2

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y sublime-text

####
echo 'WebUpd8 - Ubuntu Font Family PPA'
sudo add-apt-repository -y ppa:webupd8team/ubuntu-font-family

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y ubuntu-font-family-sources

####
echo 'WebUpd8 - WebUpd8 Themes Repository'
sudo add-apt-repository -y ppa:webupd8team/themes

#sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y adwaita-cupertino-gtk-theme adwaita-x-theme ambiance-precise-theme bluebird-gtk-theme boomerang-gtk-theme faenza-colors faenza-icon-theme faience-azur-dark faience-icon-theme gnomishbeige-theme gnomishdark-theme gnomishgray-theme holo-theme light-themes mediterraneannight-gtk-theme mint-x-icons renix-gtk-theme zukini-theme zukitwo-colors-theme zukitwo-theme

####
echo 'WebUpd8 - GNOME 3 WebUpd8 PPA'
sudo add-apt-repository -y ppa:webupd8team/gnome3

#sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y gnome-shell-classic-systray gnome-shell-extension-notesearch gnome-shell-extension-window-buttons gnome-shell-extensions gnome-shell-extensions-autohidetopbar gnome-shell-extensions-extended-places-menu gnome-shell-extensions-hamster gnome-shell-extensions-mediaplayer gnome-shell-extensions-noa11y gnome-shell-extensions-pidgin gnome-shell-extensions-weather gnome-shell-extensions-windowoverlay-icons gnome-shell-message-notifier gnome-shell-system-monitor

####
echo 'GNOME3 Team - GNOME3'
sudo add-apt-repository -y ppa:gnome3-team/gnome3

#sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y gnome-contacts gnome-disk-utility gnome-documents gnome-keyring gnome-online-accounts gnome-session gnome-tweak-tool rhythmbox totem

####
echo 'Rico Tzschichholz - GNOME Testing PPA'
sudo add-apt-repository -y ppa:ricotz/testing

#sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y gnome-screensaver gnome-shell gnome-shell-extensions gnome-themes-standard gnome-tweak-tool rhythmbox light-themes

####
echo 'Matthieu James - equinox'
sudo add-apt-repository -y ppa:tiheum/equinox

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y faenza-icon-theme faience-icon-theme faience-theme

####
echo 'Gimps - Gimp'
sudo add-apt-repository -y ppa:gimps/gimp

#sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y gimp

####
echo 'otto06217 - Gimp'
sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y gimp gimp-plugin-registry gimp-resynthesizer

####
echo 'Conscious User - Polly Daily & Unstable PPA'
sudo apt-add-repository -y ppa:conscioususer/polly-daily
sudo apt-add-repository -y ppa:conscioususer/polly-unstable

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y polly

####
echo 'Pidgin Developers team - PPA by Pidgin Developers'
sudo apt-add-repository -y ppa:pidgin-developers/ppa

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y pidgin pidgin-data pidgin-plugin-pack pidgin-themes pidgin-lastfm pidgin-guifications msn-pecan pidgin-musictracker

####
echo 'jd-team - jdownloader'
sudo add-apt-repository -y ppa:jd-team/jdownloader

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y jdownloader

####
echo 'glennric - dolphin-emu'
sudo add-apt-repository -y ppa:glennric/dolphin-emu

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y dolphin-emu

####
echo 'LibreOffice Packaging - LibreOffice PPA'
sudo add-apt-repository -y ppa:libreoffice/ppa

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y

####
echo 'linrunner - TLP'
sudo add-apt-repository -y ppa:linrunner/tlp

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y tlp

####
echo 'Ubuntu Mozilla Daily Build Team - Firefox and Thunderbird daily builds'
sudo add-apt-repository -y ppa:ubuntu-mozilla-daily/ppa

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y

####
echo 'Ubuntu Mozilla Security Team - PPA for Ubuntu Mozilla Security Team'
sudo add-apt-repository -y ppa:ubuntu-mozilla-security/ppa

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y #firefox

####
echo 'Ubuntu Wine Team - Wine Team PPA'
sudo add-apt-repository -y ppa:ubuntu-wine/ppa

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y wine1.7 winetricks

####
echo 'Ubuntu-X - X Updates'
sudo add-apt-repository -y ppa:ubuntu-x-swat/x-updates

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y xdiagnose

####
echo 'xorg crack pushers - xorg-edgers fresh X crack'
sudo add-apt-repository -y ppa:xorg-edgers/ppa

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y

####
echo 'QR Tools Team - QR Tools Stable'
sudo add-apt-repository -y ppa:qr-tools-developers/qr-tools-stable

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y qtqr python-qrtools

####
echo 'BackBox Linux v3 - Precise'
sudo add-apt-repository -y ppa:backbox/three #v3 - precise
#sudo add-apt-repository -y ppa:backbox/two #v2 - natty
#sudo add-apt-repository -y ppa:backbox/one #v1 - lucid

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y aircrack-ng tcpdump ngrep

####
echo 'Liviu Andronic - ClamTk PPA'
sudo add-apt-repository -y ppa:landronimirc/clamtk

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y #clamtk

####
echo 'Bernd Kreuss - fpc, lazarus'
sudo add-apt-repository -y ppa:prof7bit/fpc-2.6.0
sudo add-apt-repository -y ppa:prof7bit/fpc-2.6-latest
sudo add-apt-repository -y ppa:prof7bit/lazarus-1.0.0
sudo add-apt-repository -y ppa:prof7bit/lazarus-1.0-latest

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y fpc lazarus

####
echo 'MariaDB'
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo sh -c 'echo "deb http://ftp.ddg.lth.se/mariadb/repo/5.5/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/mariadb.list'
sudo sh -c 'echo "deb-src http://ftp.ddg.lth.se/mariadb/repo/5.5/ubuntu $(lsb_release -sc) main" >> /etc/apt/sources.list.d/mariadb.list'
sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo apt-get -f install -y mariadb-server

####
echo 'Installing Google Chrome'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
sudo sh -c 'echo "deb http://dl.google.com/linux/talkplugin/deb/ stable main" > /etc/apt/sources.list.d/google-talkplugin.list'
#sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo aptitude install -y google-chrome-stable google-talkplugin

####
echo 'Installing Zend Server'
wget http://repos.zend.com/zend.key -O- | sudo apt-key add -

sudo sh -c 'echo "deb http://repos.zend.com/zend-server/deb server non-free" > /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.1/deb server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.1/deb_ssl1.0 server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.2/deb server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.2/deb_ssl1.0 server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.3/deb server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.3/deb_ssl1.0 server non-free" >> /etc/apt/sources.list.d/zend.list'
sudo sh -c 'echo "#deb http://repos.zend.com/zend-server/6.3/deb_apache2.4 server non-free" >> /etc/apt/sources.list.d/zend.list'
#sudo add-apt-repository "deb http://repos.zend.com/zend-server/deb server non-free"

### zend framework
sudo sh -c 'echo "export ZEND_PATH=/usr/local/zend" > /etc/profile.d/zend.sh'
sudo sh -c 'echo "export PATH=$PATH:/usr/local/zend/bin:/usr/local/zend/share/ZendFramework/bin:/usr/local/zend/apache2/bin" >> /etc/profile.d/zend.sh'
sudo sh -c 'echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/zend/lib" >> /etc/profile.d/zend.sh'

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo aptitude install -y zend-server-ce-php-5.3 control-panel-zend-server phpmyadmin-zend-server java-bridge-zend-server
sudo aptitude install -y zend-framework zend-framework-bin phpunit php-pear phpmyadmin
#sudo aptitude install -y mysql-server mysql-workbench
sudo aptitude install -y git-core gitk gitweb git-svn

sudo mkdir /etc/skel/public_html
sudo a2enmod userdir
sudo service apache2 restart
#sudo gedit /usr/local/zend/etc/php.ini
#sudo gedit /etc/mysql/my.cnf

####
echo 'DropBox - https://www.dropbox.com/install?os=lnx'
cd ~/Downloads/
wget -c https://linux.dropbox.com/packages/debian/dropbox_1.6.1_i386.deb; sudo dpkg -i dropbox_1.6.1_i386.deb

####
echo 'Copy - https://www.copy.com/install/'

#wget -c https://copy.com/install/linux/Copy.tgz -O- | tar xzvf -
cd ~/Downloads/
wget -c https://copy.com/install/linux/Copy.tgz; tar xzvf Copy.tgz
sudo mv copy /opt/; cd /opt/copy/; sudo rm -rfv x86_64/; x86/./CopyAgent &

####
echo 'VirtualBox - https://www.virtualbox.org/'

cd ~/Downloads/
#wget -c http://download.virtualbox.org/virtualbox/4.3.8/virtualbox-4.3_4.3.8-92456~Ubuntu~precise_i386.deb; sudo dpkg -i virtualbox-4.3_4.3.8-92456~Ubuntu~precise_i386.deb

wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" > /etc/apt/sources.list.d/virtualbox.list'
#sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib"

sudo apt-get -y autoremove; sudo apt-get -y autoclean; sudo apt-get update; sudo aptitude install -y #virtualbox-4.3

####
echo 'GetDeb Software Portal - http://www.getdeb.net/'
cd ~/Downloads/
wget -q http://archive.getdeb.net/install_deb/getdeb-repository_0.1-1~getdeb1_all.deb

wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu precise-getdeb apps" > /etc/apt/sources.list.d/getdeb.list'

sudo apt-get install -y gnome-system-tools ghex glade wallch alacarte fbreader acroread ejecter gdebi ripperx easytag audacious audacity easymp3gain-gtk vlc subdownloader cheese skype pidgin chmsee synapse synaptic filezilla inkscape agave dia gimp bleachbit xchat trimage flashplugin-installer dconf-tools ubuntu-restricted-extras zsnes indicator-cpufreq tuxguitar tuxpaint tuxtype tuxmath

### fazer um script de backup desta pasta
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop

