#!/bin/bash

databaseFilename=mysql-db-databases.txt
targetDir=/postfix/bkp_mysql
dia=`date +%Y%m%d`
host=tarumazinho

#Delete old files?
#deleteOldfiles=`find ${targetDir} -type f -mtime +15 -exec ls -l {} \;`
deleteOldfiles=`find ${targetDir} -type f -mtime +15 -exec rm -f {} \;`
#echo $deleteOldfiles

mysql -e "show databases"  > /tmp/${databaseFilename}
bancos=`tail -n +2 /tmp/${databaseFilename} | grep -v information_schema | grep -v mysql | grep -v performance_schema`

#Loop dump mysql
for banco in $bancos; do
  echo Backup Atual: $banco
  mysqldump  ${banco} > ${targetDir}/${host}-${banco}-${dia}.sql
 # tar czvf ${targetDir}/${host}-${banco}-${dia}.tgz ${targetDir}/${host}-${banco}-${dia}.sql
  gzip -v9 ${targetDir}/${host}-${banco}-${dia}.sql
#  rm -f ${targetDir}/${host}-${banco}-${dia}.sql
  rm -f /tmp/${databaseFilename}

done

exit 0

