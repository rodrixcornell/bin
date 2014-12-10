#!/bin/bash

#unset ORACLE_HOME ORACLE_BASE LD_LIBRARY_PATH SQLPATH NLS_LANG NLS_CHARACTERSET NLS_NCHAR_CHARACTERSET NLS_DATE_FORMAT CLASSPATH TNS_ADMIN
# Oracle 32
if [ -d "/usr/lib/oracle/12.1/client" ]; then
	export ORACLE_HOME="/usr/lib/oracle/12.1/client"
fi
# Oracle 64
if [ -d "/usr/lib/oracle/12.1/client64" ]; then
	export ORACLE_HOME="/usr/lib/oracle/12.1/client64"
fi
# Oracle Home
if [ -e "$ORACLE_HOME" ]; then
	export ORACLE_BASE="$ORACLE_HOME"

	export PATH="$PATH:$ORACLE_HOME/bin"
	#if [ -z "$LD_LIBRARY_PATH" ]; then
	#	export LD_LIBRARY_PATH="$ORACLE_HOME/lib"
	#else
	#	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$ORACLE_HOME/lib"
	#fi
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$ORACLE_HOME/lib"


	if [ -e "$SQLPATH" ]; then
		if [ -z "$SQLPATH" ]; then
			export SQLPATH="$ORACLE_HOME/lib"
		else
			export SQLPATH="$SQLPATH:$ORACLE_HOME/lib"
		fi
	else
		export SQLPATH="$ORACLE_HOME/lib"
	fi
	export NLS_LANG="BRAZILIAN PORTUGUESE_BRAZIL.UTF8"
	export NLS_CHARACTERSET="UTF8"
	export NLS_NCHAR_CHARACTERSET="AL32UTF8"
	export NLS_DATE_FORMAT="DD/MM/YYYY HH24:MI:SS"
	if [ -z "$CLASSPATH" ]; then
		export CLASSPATH="$ORACLE_HOME/lib/ojdbc7.jar"
		export CLASSPATH="$CLASSPATH:$ORACLE_HOME/lib/ojdbc6.jar"
	else
		export CLASSPATH="$CLASSPATH:$ORACLE_HOME/lib/ojdbc7.jar"
		export CLASSPATH="$CLASSPATH:$ORACLE_HOME/lib/ojdbc6.jar"
	fi
fi
# Oracle TNS
if [ -d "$HOME/oracle_client/network/admin" ]; then
	export TNS_ADMIN="$HOME/oracle_client/network/admin"
	#export ORACLE_DICT="$HOME/oracle_client/dict.sql"
fi
