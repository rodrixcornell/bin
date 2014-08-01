#!/bin/bash
DATA=`date +%Y-%m-%d`
#DIR=/home/git/repositories

cd /tmp
mkdir backup_"$DATA"
cd backup_"$DATA"

#tar -zcvf git_"$DATA".tar.gz $DIR /home/git/.git* /home/git/.ssh /home/git/repositories
tar -zcvf git_"$DATA".tgz /home/git/.git* /home/git/.ssh /home/git/repositories

mysqldump redmine -u redmine --password=redmine > redmine_dsti_"$DATA".sql
mysqldump redmine_dosp -u redmine_dosp --password=redmine_dosp > redmine_dosp_"$DATA".sql
mysqldump redmine_deps -u redmine_deps --password=redmine_deps > redmine_deps_"$DATA".sql
mysqldump redmine_ti -u redmine_ti --password=redmine_ti > redmine_ti_"$DATA".sql

cp -rf /opt/redmine_dsti/files ./files_dsti
cp -rf /opt/redmine_dosp/files ./files_dosp
cp -rf /opt/redmine_deps/files ./files_deps
cp -rf /opt/redmine_ti/files ./files_ti

cd ..

tar -zcvf backup_redmine_git_"$DATA".tgz backup_"$DATA"

rm -rf backup_"$DATA"

smbmount //172.19.10.33/redmine /mnt/bkp/ --username=administrador --password=4dm1n53m4d
#smbmount //172.19.10.6/redmine /media/bkp/ --username=administrador --password=4dm1n53m4d
#mount.cifs //172.19.11.101/redmine /mnt/bkp/ -o user=srv-backup pass=4dm1n53m4d dom=

cp backup_redmine_git_"$DATA".tgz /mnt/bkp/

umount /mnt/bkp

rm backup_redmine_git_"$DATA".tgz
