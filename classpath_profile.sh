#!/bin/bash
## Java ClassPath
#unset CLASSPATH
if [ -e "$CLASSPATH" ]; then
	if [ -z "$CLASSPATH" ]; then
		export CLASSPATH="$HOME/lib/mysql-connector-java-5.1.6-bin.jar"
		export CLASSPATH=".:$CLASSPATH:$HOME/lib/postgresql-9.3-1102.jdbc41.jar"
		#CLASSPATH=$CLASSPATH:$HOME/lib/dom4j-1.6.1.jar
	else
		export CLASSPATH=".:$CLASSPATH:$HOME/lib/mysql-connector-java-5.1.6-bin.jar"
		export CLASSPATH=".:$CLASSPATH:$HOME/lib/postgresql-9.3-1102.jdbc41.jar"
		#CLASSPATH=$CLASSPATH:$HOME/lib/dom4j-1.6.1.jar
	fi
fi
