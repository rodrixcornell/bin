#!/bin/bash
sudo echo 'test sudo'
data=`/bin/date +%Y%m%d_%H%M%S`
machine=`/bin/uname -m`
origin=${HOSTNAME}__${machine}__${data}

#echo $data
#echo ${data}

# if running my profile
if [ ! -d /opt/bkp ]; then
    sudo mkdir /opt/bkp
    sudo chown 1000:1000 -R /opt/bkp
    echo "Pasta Criada em /opt"
else
    echo "Pasta Já Existe em /opt"
    rm -rfv /opt/bkp/${HOSTNAME}*
fi

if [ ! -d ~/MEOCloud/bkp ]; then
    mkdir ~/MEOCloud/bkp
    echo "Pasta Criada em ~/MEOCloud"
else
    echo "Pasta Já Existe em ~/MEOCloud"
    #rm -rfv ~/MEOCloud/bkp/*
fi

killall firefox chrome opera
#killall dropbox CopyAgent #megasync meocloud-gui meocloudd
killall skype pidgin #iptux #teamviewerd
#cd ~/grive/ && grive

#cd ~
#echo "Checa repositórios Git Semad"
#check_git.sh

cd ~
echo "Localizando Lixo"
#find ~ -name '*~' -exec echo {} \;
#find ~ -name '*~' -exec rm {} \;
#sudo find / -name '*~' -exec echo {} \;
sudo find / -name '*~' -exec rm {} \;
#sudo find / -name '*.save' -exec echo {} \;
sudo find / -name '*.save' -exec rm {} \;
#sudo find / -name '*~' -exec echo {} \;
#sudo find / -name '*~' -exec rm {} \;

cd ~
echo "Copia do Bash Histórico"
cat .bash_history > /opt/bkp/${origin}__history.txt
cat .bash_history > ~/MEOCloud/bkp/${origin}__history.txt
echo "Copia das Variáveis de Ambiente"
export > /opt/bkp/${origin}__export.txt
export > ~/MEOCloud/bkp/${origin}__export.txt

cd ~
echo "Dump do MySQL ou MariaDB"
mysqldump --all-databases -u root --password=xkpptrock1990 > /opt/bkp/${origin}__mysqldump.sql
#tar -czvf /opt/bkp/${origin}__mysqldump.sql.tgz /opt/bkp/${origin}__mysqldump.sql
rar a -m5 -idp -y /opt/bkp/${origin}__mysqldump.sql.rar /opt/bkp/${origin}__mysqldump.sql
rm /opt/bkp/${origin}__mysqldump.sql
cp /opt/bkp/${origin}__mysqldump.sql.rar ~/MEOCloud/bkp

echo "Dump do MySQL ou MariaDB"
rar a -m5 -idp -y /opt/bkp/${origin}__semad.sql.rar /opt/bkp/SEMAD.sql
rm /opt/bkp/SEMAD.sql
cp /opt/bkp/${origin}__semad.sql.rar ~/MEOCloud/bkp

rar a -m5 -idp -y /opt/bkp/${origin}__mercattopmm.sql.rar /opt/bkp/MERCATTOPMM.sql
rm /opt/bkp/MERCATTOPMM.sql
cp /opt/bkp/${origin}__mercattopmm.sql.rar ~/MEOCloud/bkp

echo "Backup SQLs do MySQL ou MariaDB"
rar a -m5 -idp -y /opt/bkp/${origin}__workbench-mysql.rar ~/workbench-mysql
cp /opt/bkp/${origin}__workbench-mysql.rar ~/MEOCloud/bkp

echo "Backup Configurações Oracle Client"
rar a -m5 -idp -y /opt/bkp/${origin}__oracle_client.rar ~/oracle_client
cp /opt/bkp/${origin}__oracle_client.rar ~/MEOCloud/bkp

echo "Backup Pasta Java ~/lib"
#tar -czvf /opt/bkp/${origin}__lib.tgz ~/lib
rar a -m5 -idp -y /opt/bkp/${origin}__lib.rar ~/lib
cp /opt/bkp/${origin}__lib.tgz ~/MEOCloud/bkp

echo "Backup Pasta Skype"
#rar a -rr -r -v1g -y /opt/bkp/${origin}_pastas.rar -x.* ~/bin/*.*sh ~/bin/*.*py ~/bin/*profile ~/bin/tor* ~/bin/sql* ~/Imagens ~/Aptana\ Studio\ 3\ Workspace/ ~/Projects ~/ProgramasRFB ~/public_html /usr/share/backgrounds /etc
rar a -m5 -idp -y /opt/bkp/${origin}__Skype.rar ~/Skype
cp /opt/bkp/${origin}__Skype.rar ~/MEOCloud/bkp

echo "Backup Pasta projetos"
rar a -m5 -idp -y /opt/bkp/${origin}__projects.rar ~/projects*
cp /opt/bkp/${origin}__projects.rar ~/MEOCloud/bkp

echo "Backup Pasta workspace"
rar a -m5 -idp -y /opt/bkp/${origin}__workspace.rar ~/workspace*
cp /opt/bkp/${origin}__workspace.rar ~/MEOCloud/bkp

echo "Backup Pasta public_html"
rar a -m5 -idp -y /opt/bkp/${origin}__public_html.rar ~/public_html
cp /opt/bkp/${origin}__public_html.rar ~/MEOCloud/bkp

echo "Backup Pasta Pessoais"
cp /usr/share/backgrounds ~/Imagens
find ~/Imagens -name '*xml' -exec rm -rfv {} \;
find ~/Imagens -name '*contest' -exec rm -rfv {} \;
find ~/Imagens -name 'Thumbs*' -exec rm -rfv {} \;
rar a -m5 -idp -y /opt/bkp/${origin}__Pastas.rar ~/Área\ de\ Trabalho/ ~/Documentos ~/Imagens ~/ProgramasRFB
rar a -m5 -idp -y /opt/bkp/${origin}__SpiderOakHive.rar ~/SpiderOak\ Hive
rar a -m5 -idp -y /opt/bkp/${origin}__GoogleDrive.rar ~/Google\ Drive
rar a -m5 -idp -y /opt/bkp/${origin}__UbuntuOne.rar ~/Ubuntu\ One
#rar a -m5 -idp -y /opt/bkp/${origin}__Dropbox.rar ~/Dropbox
#rar a -m5 -idp -y /opt/bkp/${origin}__Copy.rar ~/Copy
#rar a -m5 -idp -y /opt/bkp/${origin}__MEOCloud.rar ~/MEOCloud
#rar a -m5 -idp -y /opt/bkp/${origin}__MEGA.rar ~/MEGA

echo "Backup Pasta /etc"
#tar -czvf /opt/bkp/${origin}__etc.tgz /etc
rar a -m5 -idp -y /opt/bkp/${origin}__etc.rar /etc

echo "Backup Configurações"
tar -czvf /opt/bkp/${origin}__config.tgz ~/.bitcasa* ~/.config* ~/.easytag* ~/.filezilla* ~/.fonts* ~/.gconf* ~/.gkrellm* ~/.gnome2/nautilus-scripts* ~/.gnupg* ~/.icon* ~/.local/share/applications* ~/.mozilla* ~/.purple* ~/.receitanet* ~/.Skype* ~/.skype* ~/.*torage* ~/.ssh* ~/.synaptic* ~/.themes* ~/.thunderbird* ~/.xchat2* ~/.youtube-dl-gui* ~/.bash* ~/bash* ~/.git* ~/.inputrc* ~/.pearrc* ~/.profile* ~/.sqlplus* ~/.Xmodmap* ~/.face* ~/.nanorc* ~/.wgetrc*
#rar a -m5 -idp -y /opt/bkp/${origin}__config.rar ~/.bitcasa* ~/.config* ~/.easytag ~/.gconf* ~/.gnupg* ~/.icon* ~/.filezilla* ~/.mozilla* ~/.opera ~/.purple ~/.Skype* ~/.skype* ~/.smestorage* ~/.SMEStorage* ~/.ssh ~/.synaptic ~/.thunderbird* ~/.bash* ~/bash* ~/.git* ~/.profile* ~/.Xmodmap* ~/.face* ~/.wgetrc ~/.local/share/applications
cp /opt/bkp/${origin}__config.tgz ~/MEOCloud/bkp

#echo "Backup Pasta ~/bin"
#tar -czvf /opt/bkp/${origin}__bin.tgz ~/bin --exclude=$HOME/bin/adt-bundle* --exclude=$HOME/bin/AptanaStudio* --exclude=$HOME/bin/eclipse* --exclude=$HOME/bin/FreeNet* --exclude=$HOME/bin/netbeans* --exclude=$HOME/bin/smartgit* --exclude=$HOME/bin/sqldeveloper* --exclude=$HOME/bin/tor* --exclude=$HOME/bin/Zend* --exclude=$HOME/bin/cria* --exclude=$HOME/bin/bin* --exclude=$HOME/bin/t50*
#cp /opt/bkp/${origin}__bin.tgz ~/MEOCloud/bkp

echo
#nohup dropbox start -i &
#nohup CopyAgent &
nohup skype &
nohup pidgin &
#nohup meocloud-gui &
#nohup megasync &
#insync &
#SpiderOak &
#firefox &
#chrome &

cd ~
