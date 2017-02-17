#!/bin/bash

databaseFilename=mysql-db-databases.txt
targetDir=/var/tempfiles
dia=`date +%Y%m%d`
targetTransferdir=/backup/mysql/
targetTransferhost=ituxi
targetTransferuser=mysqlbackup

#Delete old files?
#deleteOldfiles=`find ${targetDir} -type f -mtime +1 -exec ls -l {} \;`
#echo $deleteOldfiles

mysql -e "show databases" -u root -p'senha' > /tmp/${databaseFilename}
bancos=`tail -n +2 /tmp/${databaseFilename} | grep -v information_schema | grep -v mysql | grep -v performance_schema`

#Loop dump mysql
for banco in $bancos; do
  echo Backup Atual: $banco
  mysqldump -u root -p'senha' ${banco} > ${targetDir}/${banco}.sql
  tar zcvf ${targetDir}/${banco}.tgz ${targetDir}/${banco}.sql
  rm -rf ${targetDir}/${banco}.sql
done

#loop sftp transfer
#for arq in `ls -l ${targetDir} | tail -n +1 | awk '{ print $9}'`; do
  #echo Tranfer Atual: $arq
  echo Arquivos sendo tranferidos...
  scp -i /home/aorlando/keys/mdb.priv ${targetDir}/* ${targetTransferuser}@$targetTransferhost:${targetTransferdir}
#done

exit 0

