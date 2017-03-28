#!/bin/bash
umask 077

if [ -z "$1" ];
	then
		echo ''

mysqldump --host=cubatao --user=root --order-by-primary=TRUE --flush-privileges=TRUE --flush-logs=TRUE --complete-insert=TRUE --max_allowed_packet=1G

mysqldump --password=4dm1n53m4d --protocol=tcp --port=3306 --default-character-set=utf8  --single-transaction=TRUE --routines --events --comments --extended-insert --databases redmine > ~/dumps/dump_$(date +%Y%m%d.%H%M%S.%N)_cubatao_redmine.sql

mysqldump --password=4dm1n53m4d --protocol=tcp --port=3306 --default-character-set=utf8 --single-transaction=TRUE --routines --events --comments --no-data

mysqldump --password=4dm1n53m4d --protocol=tcp --port=3306 --default-character-set=utf8 --single-transaction=TRUE --routines --events --comments --no-create-info=TRUE


sed "s/redmine\`/redmine_test\`/g;s/database \'redmine/database \'redmine_test/g;s/Host: cubatao/Host: divisa/g;s/Database: redmine/Database: redmine_test/g;s/redmine.dsti/pericuma/g;s/172.19.10.12\/redmine3.1/pericuma.manaus.am.gov.br/g;s/sistemaspmm.am/sistemaspmm.manaus.am/g;s/DSTI - Redmine/Redmine Test - DSTI/g;s/Redmine - DSTI/Redmine Test - DSTI/g" ~/dumps/dump_ > ~/dumps/dump_

sed "s/redmine\`/redmine_test\`/g;s/database 'redmine/database 'redmine_test/g;s/Host: cubatao/Host: divisa/g;s/Database: redmine/Database: redmine_test/g;s/redmine.dsti/pericuma/g;s/172.19.10.12\/redmine3.1/pericuma.manaus.am.gov.br/g;s/sistemaspmm.am/sistemaspmm.manaus.am/g;s/DSTI - Redmine/Redmine Test - DSTI/g;s/Redmine - DSTI/Redmine Test - DSTI/g" ~/dumps/cubatao-redmine-20170321-data.sql > ~/dumps/divisa-redmine_test-20170321-data.sql

sed "s/redmine\`/redmine_development\`/g;s/database 'redmine/database 'redmine_development/g;s/Host: cubatao/Host: jaragua/g;s/Database: redmine/Database: redmine_development/g;s/redmine.dsti/parnamirim/g;s/172.19.10.12\/redmine3.1/parnamirim.manaus.am.gov.br/g;s/sistemaspmm.am/sistemaspmm.manaus.am/g;s/DSTI - Redmine/Redmine Development - DSTI/g;s/Redmine - DSTI/Redmine Development - DSTI/g" ~/dumps/cubatao-redmine-20170321-data.sql > ~/dumps/jaragua-redmine_development-20170321-data.sql

sed "s/redmine\`/redmine_test\`/g;s/database 'redmine/database 'redmine_test/g;s/Host: cubatao/Host: divisa/g;s/Database: redmine/Database: redmine_test/g;s/redmine.dsti/pericuma/g;s/172.19.10.12\/redmine3.1/pericuma.manaus.am.gov.br/g;s/sistemaspmm.am/sistemaspmm.manaus.am/g;s/DSTI - Redmine/Redmine Test - DSTI/g;s/Redmine - DSTI/Redmine Test - DSTI/g" ~/dumps/cubatao-redmine-20170321-structure.sql > ~/dumps/divisa-redmine_test-20170321-structure.sql

sed "s/redmine\`/redmine_development\`/g;s/database 'redmine/database 'redmine_development/g;s/Host: cubatao/Host: jaragua/g;s/Database: redmine/Database: redmine_development/g;s/redmine.dsti/parnamirim/g;s/172.19.10.12\/redmine3.1/parnamirim.manaus.am.gov.br/g;s/sistemaspmm.am/sistemaspmm.manaus.am/g;s/DSTI - Redmine/Redmine Development - DSTI/g;s/Redmine - DSTI/Redmine Development - DSTI/g" ~/dumps/cubatao-redmine-20170321-structure.sql > ~/dumps/jaragua-redmine_development-20170321-structure.sql


structure

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('123456789');



CREATE USER 'adam.souza'@'172.19.10.47' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `adam.souza` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `adam.souza`.* TO 'adam.souza'@'172.19.10.47';

CREATE USER 'osmundo.vieira'@'172.19.10.52' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `osmundo.vieira` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `osmundo.vieira`.* TO 'osmundo.vieira'@'172.19.10.52';

CREATE USER 'harryson.palheta'@'172.19.10.53' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `harryson.palheta` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `harryson.palheta`.* TO 'harryson.palheta'@'172.19.10.53';

CREATE USER 'amanda.praia'@'172.19.10.54' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `amanda.praia` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `amanda.praia`.* TO 'amanda.praia'@'172.19.10.54';

CREATE USER 'rodrigo.cabral'@'172.19.10.68' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `rodrigo.cabral` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `rodrigo.cabral`.* TO 'rodrigo.cabral'@'172.19.10.68';

CREATE USER 'smith.junior'@'172.19.10.69' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `smith.junior` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `smith.junior`.* TO 'smith.junior'@'172.19.10.69';

CREATE USER 'luiz.schmitt'@'172.19.10.70' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `luiz.schmitt` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `luiz.schmitt`.* TO 'luiz.schmitt'@'172.19.10.70';

CREATE USER 'marcio.roger'@'172.19.10.71' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `marcio.roger` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `marcio.roger`.* TO 'marcio.roger'@'172.19.10.71';

CREATE USER 'francibel.neves'@'172.19.10.73' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `francibel.neves` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `francibel.neves`.* TO 'francibel.neves'@'172.19.10.73';

CREATE USER 'ivanilson.ribeiro'@'172.19.10.74' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `ivanilson.ribeiro` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `ivanilson.ribeiro`.* TO 'ivanilson.ribeiro'@'172.19.10.74';

CREATE USER 'cleonice.garcia'@'172.19.10.75' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `cleonice.garcia` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `cleonice.garcia`.* TO 'cleonice.garcia'@'172.19.10.75';

CREATE USER 'carlos.vieira'@'172.19.10.79' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `carlos.vieira` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `carlos.vieira`.* TO 'carlos.vieira'@'172.19.10.79';

CREATE USER 'vanessa.melo'@'172.19.10.16' IDENTIFIED BY '123456789';
CREATE DATABASE IF NOT EXISTS `vanessa.melo` CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON `vanessa.melo`.* TO 'vanessa.melo'@'172.19.10.16';





CREATE USER 'harryson.palheta'@'172.19.10.53' IDENTIFIED BY '123456789';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, FILE, INDEX, ALTER, CREATE TEMPORARY TABLES, CREATE VIEW, EVENT, TRIGGER, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, EXECUTE ON *.* TO 'harryson.palheta'@'172.19.10.53' REQUIRE SSL WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
CREATE DATABASE IF NOT EXISTS `harryson.palheta`;
GRANT ALL PRIVILEGES ON `harryson.palheta`.* TO 'harryson.palheta'@'172.19.10.53';
ALL PRIVILEGES ON *.* FROM 'harryson.palheta'@'172.19.10.53';
REVOKE GRANT OPTION ON *.* FROM 'harryson.palheta'@'172.19.10.53';
GRANT USAGE ON *.* TO 'harryson.palheta'@'172.19.10.53' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

CREATE USER 'amanda.praia'@'172.19.10.54' IDENTIFIED BY '123456789';
GRANT SELECT, INSERT, UPDATE, DELETE, FILE ON *.* TO 'amanda.praia'@'172.19.10.54' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
CREATE DATABASE IF NOT EXISTS `amanda.praia`;
GRANT ALL PRIVILEGES ON `amanda.praia`.* TO 'amanda.praia'@'172.19.10.54';

CREATE USER 'luiz.schmitt'@'172.19.10.70' IDENTIFIED BY '123456789';
GRANT USAGE ON *.* TO 'luiz.schmitt'@'172.19.10.70' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
CREATE DATABASE IF NOT EXISTS `luiz.schmitt`;
GRANT ALL PRIVILEGES ON `luiz.schmitt`.* TO 'luiz.schmitt'@'172.19.10.70';