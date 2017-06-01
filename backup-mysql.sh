#!/bin/bash

databaseFilename=mysql-db-databases.txt
targetDir=/var/mysql-dump
dia=`date +%Y%m%d`
host=cubatao

#Delete old files?
#deleteOldfiles=`find ${targetDir} -type f -mtime +15 -exec ls -l {} \;`
deleteOldfiles=`find ${targetDir} -type f -mtime +15 -exec rm -f {} \;`
#echo $deleteOldfiles

mysql --password=4dm1n53m4d -e 'show databases' > /tmp/${databaseFilename}
bancos=`tail -n +2 /tmp/${databaseFilename} | grep -v information_schema | grep -v mysql | grep -v performance_schema | grep -v sys`

#Loop dump mysql
for banco in $bancos; do
  echo Backup Atual: $banco
  mysqldump --password=4dm1n53m4d --protocol=tcp --port=3306 --default-character-set=utf8 --single-transaction=TRUE --routines --events --comments --no-data ${banco} > ${targetDir}/${host}-${banco}-${dia}-structure.sql
  mysqldump --password=4dm1n53m4d --protocol=tcp --port=3306 --default-character-set=utf8 --single-transaction=TRUE --routines --events --comments --no-create-info=TRUE ${banco} > ${targetDir}/${host}-${banco}-${dia}-data.sql
#  tar czvf ${targetDir}/${host}-${banco}-${dia}.tgz ${targetDir}/${host}-${banco}-${dia}.sql
  gzip -v9f ${targetDir}/${host}-${banco}-${dia}*.sql
#  rm -f ${targetDir}/${host}-${banco}-${dia}.sql
  rm -f /tmp/${databaseFilename}
done

exit 0

