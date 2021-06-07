#!/bin/bash

# set -xv
targetDir=~/dumps/MySQL
dia=`date +%Y%m%d`

#Delete old files?
#deleteOldfiles=`find ${targetDir} -type f -mtime +15 -exec ls -l {} \;`
#deleteOldfiles=`find ${targetDir} -type f -mtime +15 -exec rm -f {} \;`
#echo $deleteOldfiles

# hosts='cubatao divisa jaragua ararangua'
# hosts='ararangua'
# hosts='jaragua'
hosts='cubatao'
hosts='divisa jaragua'
hosts='cubatao divisa jaragua'
for host in $hosts; do
  mkdir -p ${targetDir}/${host}
  mysql --host=${host} --port=3306 --user=root --password=4dm1n53m4d -e 'SELECT schema_name FROM information_schema.schemata ORDER BY schema_name DESC' > /tmp/${host}-${dia}
  bancos=`tail -n +2 /tmp/${host}-${dia} | grep -v information_schema | grep -v performance_schema | grep -v sys`

  #Loop dump mysql
  rm -rf ${targetDir}/${host}/* 2>&1
  for banco in $bancos; do
    echo Backup Atual: ${host} - ${banco}
    mysql --host=${host} --port=3306 --user=root --password=4dm1n53m4d -e "SELECT table_name FROM information_schema.tables WHERE table_schema = '${banco}' ORDER BY table_name DESC" > /tmp/${host}-${dia}-${banco}
    tabelas=`tail -n +2 /tmp/${host}-${dia}-${banco}`
    # for tabela in $tabelas; do
      # echo ${banco} - ${tabela}
      # echo "CREATE TABLE _${tabela}_log LIKE ${tabela}"
      # mysql --host=${host} --port=3306 --user=root --password=4dm1n53m4d -e "SELECT column_name FROM information_schema.columns WHERE table_schema = '${banco}' AND table_name = '${tabela}' ORDER BY column_name DESC" > /tmp/${host}-${dia}-${banco}-${tabela}
      # colunas=`tail -n +2 /tmp/${host}-${dia}-${banco}-${tabela}`
      # for coluna in $colunas; do
      #   echo ${banco} - ${tabela} - ${coluna}
      # done
    # done
#   done
# done

    mysqldump --host=${host} --port=3306 --user=root --password=4dm1n53m4d --protocol=tcp --default-character-set=utf8 --single-transaction=TRUE --routines --events --comments --add-drop-database --add-drop-trigger --no-data ${banco} > ${targetDir}/${host}/${banco}-${dia}-00-structure.sql
    sed -i "17s/^/&\\nCREATE SCHEMA IF NOT EXISTS \`${banco}\` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;\\nUSE \`${banco}\`;\\n/" ${targetDir}/${host}/${banco}-${dia}-00-structure.sql
    mysqldump --host=${host} --port=3306 --user=root --password=4dm1n53m4d --protocol=tcp --default-character-set=utf8 --single-transaction=TRUE --skip-triggers --comments --no-create-info=TRUE ${banco} > ${targetDir}/${host}/${banco}-${dia}-01-data.sql
    sed -i "17s/^/&\\nUSE \`${banco}\`;\\n/" ${targetDir}/${host}/${banco}-${dia}-01-data.sql
    ###
    # https://www.digitalocean.com/community/tutorials/how-to-migrate-mysql-database-to-postgres-using-pgloader
    # https://github.com/lanyrd/mysql-postgresql-converter
    #
    # echo Backup Atual Compatible PostgreSQL: $banco
    # mysqldump --host=${host} --port=3306 --user=root --password=4dm1n53m4d --protocol=tcp --compatible=postgresql --default-character-set=utf8 --single-transaction=TRUE --routines --events --comments --add-drop-database --add-drop-trigger --no-data ${banco} > ${targetDir}/${host}/${banco}-${dia}-00-structure-pg0.sql
    # mysqldump --host=${host} --port=3306 --user=root --password=4dm1n53m4d --protocol=tcp --compatible=postgresql --default-character-set=utf8 --single-transaction=TRUE --routines --events --comments --no-create-info=TRUE ${banco} > ${targetDir}/${host}/${banco}-${dia}-01-data-pg0.sql
    # python ~/bin/db_converter.py ${targetDir}/${host}/${banco}-${dia}-00-structure-pg0.sql ${targetDir}/${host}/${banco}-${dia}-00-structure-pg.sql
    # python ~/bin/db_converter.py ${targetDir}/${host}/${banco}-${dia}-01-data-pg0.sql ${targetDir}/${host}/${banco}-${dia}-01-data-pg.sql
    # rm -rf ${targetDir}/${host}/${banco}-${dia}-00-structure-pg0.sql
    # rm -rf ${targetDir}/${host}/${banco}-${dia}-01-data-pg0.sql

  #  tar czvf ${targetDir}/${host}-${banco}-${dia}.tgz ${targetDir}/${host}-${banco}-${dia}.sql
    gzip -v9f ${targetDir}/${host}/${banco}-${dia}*.sql
  #  rm -f ${targetDir}/${host}-${banco}-${dia}.sql
    # rm -f /tmp/${databaseFilename}
  done
done
# set +xv

exit 0
