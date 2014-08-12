#!/bin/bash

data=`/bin/date +%Y%m%d_%H%M%S`
machine=`/bin/uname -m`
origin=${HOSTNAME}__${machine}__${data}

#echo $data
#echo ${data}

# if running my profile
if [ ! -d /opt/bkp ]; then
    sudo mkdir /opt/bkp
    mkdir ~/Copy/bkp
    sudo chown 1000:1000 -R /opt/bkp
    echo "Pasta Criada!"
else
    echo "Pasta Já Existe!"
#    sudo rm -rfv /opt/bkp/*
    rm -rfv ~/Copy/bkp/*
fi

#killall dropbox CopyAgent firefox chrome opera skype pidgin iptux #teamviewerd
#cd ~/grive/ && grive && cd ~
cd ~

echo Checa repositórios git
check_git.sh

cat .bash_history > /opt/bkp/${origin}__history.txt
cat .bash_history > ~/Copy/bkp/${origin}__history.txt

export > /opt/bkp/${origin}__export.txt
export > ~/Copy/bkp/${origin}__export.txt

cd ~

#find ~ -name '*~' -exec echo {} \;
find ~ -name '*~' -exec rm {} \;
sudo find /etc/ -name '*~' -exec rm {} \;
sudo find /etc/ -name '*save' -exec rm {} \;
#sudo find / -name '*~' -exec echo {} \;
#sudo find / -name '*~' -exec rm {} \;

mysqldump --all-databases -u root --password=xkpptrock1990 > /opt/bkp/${origin}__mysqldump.sql
#tar -czvf /opt/bkp/${origin}__mysqldump.sql.tgz /opt/bkp/${origin}__mysqldump.sql
rar a -m5 -idp -y /opt/bkp/${origin}__mysqldump.sql.rar /opt/bkp/${origin}__mysqldump.sql
rm /opt/bkp/${origin}__mysqldump.sql
cp /opt/bkp/${origin}__mysqldump.sql.rar ~/Copy/bkp

tar -czvf /opt/bkp/${origin}__config.tgz ~/.bitcasa* ~/.config* ~/.easytag ~/.gconf* ~/.gnupg* ~/.icon* ~/.filezilla* ~/.mozilla* ~/.opera ~/.purple ~/.Skype* ~/.skype* ~/.smestorage* ~/.SMEStorage* ~/.ssh ~/.synaptic ~/.thunderbird* ~/.bash* ~/bash* ~/.git* ~/.profile* ~/.Xmodmap* ~/.face* ~/.wgetrc ~/.local/share/applications
#rar a -m5 -idp -y /opt/bkp/${origin}__config.rar ~/.bitcasa* ~/.config* ~/.easytag ~/.gconf* ~/.gnupg* ~/.icon* ~/.filezilla* ~/.mozilla* ~/.opera ~/.purple ~/.Skype* ~/.skype* ~/.smestorage* ~/.SMEStorage* ~/.ssh ~/.synaptic ~/.thunderbird* ~/.bash* ~/bash* ~/.git* ~/.profile* ~/.Xmodmap* ~/.face* ~/.wgetrc ~/.local/share/applications
cp /opt/bkp/${origin}__config.tgz ~/Copy/bkp

#tar -czvf /opt/bkp/${origin}__etc.tgz /etc
rar a -m5 -idp -y /opt/bkp/${origin}__etc.rar /etc

#tar -czvf /opt/bkp/${origin}__bin.tgz ~/bin --exclude=$HOME/bin/adt-bundle* --exclude=$HOME/bin/AptanaStudio* --exclude=$HOME/bin/eclipse* --exclude=$HOME/bin/FreeNet* --exclude=$HOME/bin/netbeans* --exclude=$HOME/bin/smartgit* --exclude=$HOME/bin/sqldeveloper* --exclude=$HOME/bin/tor* --exclude=$HOME/bin/Zend* --exclude=$HOME/bin/cria* --exclude=$HOME/bin/bin* --exclude=$HOME/bin/t50*
#cp /opt/bkp/${origin}__bin.tgz ~/Copy/bkp

#tar -czvf /opt/bkp/${origin}__lib.tgz ~/lib
rar a -m5 -idp -y /opt/bkp/${origin}__lib.rar ~/lib
cp /opt/bkp/${origin}__lib.tgz ~/Copy/bkp

#rar a -rr -r -v1g -y /opt/bkp/${origin}_pastas.rar -x.* ~/bin/*.*sh ~/bin/*.*py ~/bin/*profile ~/bin/tor* ~/bin/sql* ~/Imagens ~/Aptana\ Studio\ 3\ Workspace/ ~/Projects ~/ProgramasRFB ~/public_html /usr/share/backgrounds /etc
rar a -m5 -idp -y /opt/bkp/${origin}__Skype.rar ~/Skype
cp /opt/bkp/${origin}__Skype.rar ~/Copy/bkp

rar a -m5 -idp -y /opt/bkp/${origin}__projects.rar ~/projects
cp /opt/bkp/${origin}__projects.rar ~/Copy/bkp

rar a -m5 -idp -y /opt/bkp/${origin}__projects-php.rar ~/projects-php
cp /opt/bkp/${origin}__projects-php.rar ~/Copy/bkp

rar a -m5 -idp -y /opt/bkp/${origin}__projects-java.rar ~/projects-java
cp /opt/bkp/${origin}__projects-java.rar ~/Copy/bkp

rar a -m5 -idp -y /opt/bkp/${origin}__workspace.rar ~/workspace
cp /opt/bkp/${origin}__workspace.rar ~/Copy/bkp

rar a -m5 -idp -y /opt/bkp/${origin}__public_html.rar ~/public_html
cp /opt/bkp/${origin}__public_html.rar ~/Copy/bkp

cp /usr/share/backgrounds ~/Imagens
find ~/Imagens -name '*xml' -exec rm -rfv {} \;
find ~/Imagens -name '*contest' -exec rm -rfv {} \;
rar a -m5 -idp -y /opt/bkp/${origin}__Pastas.rar ~/Área\ de\ Trabalho/ ~/Documentos ~/Imagens ~/ProgramasRFB ~/Projects ~/workspace
#rar a -m5 -idp -y /opt/bkp/${origin}__SpiderOakHive.rar ~/SpiderOak\ Hive
#rar a -m5 -idp -y /opt/bkp/${origin}__GoogleDrive.rar ~/Google\ Drive
#rar a -m5 -idp -y /opt/bkp/${origin}__UbuntuOne.rar ~/Ubuntu\ One
#rar a -m5 -idp -y /opt/bkp/${origin}__Dropbox.rar ~/Dropbox
#rar a -m5 -idp -y /opt/bkp/${origin}__Copy.rar ~/Copy

#dropbox start -i &
#CopyAgent &
#insync &
#SpiderOak &
#firefox &
#chrome &
#skype &
#pidgin &

cd ~
