#!/bin/bash
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
	if [ -e "$LD_LIBRARY_PATH" ]; then
		if [ -z "$LD_LIBRARY_PATH" ]; then
			export LD_LIBRARY_PATH="$ORACLE_HOME/lib"
		else
			export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$ORACLE_HOME/lib"
		fi
	else
		export LD_LIBRARY_PATH="$ORACLE_HOME/lib"
	fi
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
	#export NLS_NCHAR_CHARACTERSET="AL16UTF16"
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
fi