#!/bin/bash

# databaseFilename=mysql-db-databases.txt
# targetDir=/var/mysql-dump
targetDir=~/dumps
dia=`date +%Y%m%d`

#Delete old files?
#deleteOldfiles=`find ${targetDir} -type f -mtime +15 -exec ls -l {} \;`
#deleteOldfiles=`find ${targetDir} -type f -mtime +15 -exec rm -f {} \;`
#echo $deleteOldfiles

hosts='cubatao divisa jaragua ararangua'
for host in $hosts; do
  mkdir -p ${targetDir}/${host}
  # mysql --host=cubatao --port=3306 --user=root --password=4dm1n53m4d -e 'show databases' > /tmp/${databaseFilename}
  mysql --host=${host} --port=3306 --user=root --password=4dm1n53m4d -e 'show databases' > /tmp/${host}-${dia}
  # bancos=`tail -n +2 /tmp/${databaseFilename} | grep -v information_schema | grep -v mysql | grep -v performance_schema | grep -v sys`
  # bancos=`tail -n +2 /tmp/${host}-${dia} | grep -v information_schema | grep -v mysql | grep -v performance_schema | grep -v sys`
  bancos=`tail -n +2 /tmp/${host}-${dia} | grep -v information_schema | grep -v performance_schema | grep -v sys`

  #Loop dump mysql
  rm -rf ${targetDir}/${host}/* 2>&1
  for banco in $bancos; do
    echo Backup Atual: $banco
    mysqldump --host=${host} --port=3306 --user=root --password=4dm1n53m4d --protocol=tcp --default-character-set=utf8 --single-transaction=TRUE --routines --events --comments --no-data ${banco} > ${targetDir}/${host}/${banco}-${dia}-00-structure.sql
    mysqldump --host=${host} --port=3306 --user=root --password=4dm1n53m4d --protocol=tcp --default-character-set=utf8 --single-transaction=TRUE --routines --events --comments --no-create-info=TRUE ${banco} > ${targetDir}/${host}/${banco}-${dia}-01-data.sql
  #  tar czvf ${targetDir}/${host}-${banco}-${dia}.tgz ${targetDir}/${host}-${banco}-${dia}.sql
    gzip -v9f ${targetDir}/${host}/${banco}-${dia}*.sql
  #  rm -f ${targetDir}/${host}-${banco}-${dia}.sql
    # rm -f /tmp/${databaseFilename}
  done
done

exit 0

