#!/bin/bash
umask 077

if [ -z "$1" ];
	then
		echo ''

mysqldump --user=root --password=4dm1n53m4d --host=cubatao --port=3306 --default-character-set=utf8 --order-by-primary=TRUE --flush-privileges=TRUE --flush-logs=TRUE --complete-insert=TRUE --single-transaction=TRUE --max_allowed_packet=1G --protocol=tcp --routines --events --comments --extended-insert --databases redmine > ~/dumps/dump_$(date +%Y%m%d.%H%M%S.%N)_cubatao_redmine.sql

sed "s/redmine\`/redmine_test\`/g;s/database \'redmine/database \'redmine_test/g;s/Host: cubatao/Host: divisa/g;s/Database: redmine/Database: redmine_test/g;s/redmine.dsti/pericuma/g;s/172.19.10.12\/redmine3.1/pericuma.manaus.am.gov.br/g;s/sistemaspmm.am/sistemaspmm.manaus.am/g;s/DSTI - Redmine/Redmine Test - DSTI/g;s/Redmine - DSTI/Redmine Test - DSTI/g" ~/dumps/dump_ > ~/dumps/dump_
