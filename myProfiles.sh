#!/bin/bash
MACHINE=`/bin/uname -m`
#export J2SDKDIR JAVA_HOME DERBY_HOME J2REDIR JRE_HOME CLASSPATH CATALINA_HOME ORACLE_HOME ORACLE_BASE LD_LIBRARY_PATH SQLPATH TNS_ADMIN
# Java
# jdk
if [ -d "/usr/lib/jvm/java-7-oracle" ]; then
	if [ -e "$J2SDKDIR" ]; then
		if [ -z "$J2SDKDIR" ]; then
			export J2SDKDIR="/usr/lib/jvm/java-7-oracle"
			if [ -e "$JAVA_HOME" ]; then
				if [ -z "$JAVA_HOME" ]; then
					export JAVA_HOME="$J2SDKDIR"
				fi
			else
				export JAVA_HOME="$J2SDKDIR"
			fi
			if [ -e "$DERBY_HOME" ]; then
				if [ -z "$DERBY_HOME" ]; then
					export DERBY_HOME="$J2SDKDIR/db"
				fi
			else
				export DERBY_HOME="$J2SDKDIR/db"
			fi
			#jre
			export J2REDIR="$J2SDKDIR/jre"
			if [ -e "$JRE_HOME" ]; then
				if [ -z "$JRE_HOME" ]; then
					export JRE_HOME="$J2REDIR"
				fi
			else
				export JRE_HOME="$J2REDIR"
			fi
			export PATH="$PATH:$J2SDKDIR/bin:$J2SDKDIR/db/bin:$J2REDIR/bin"
			# Java ClassPath
			if [ -e "$CLASSPATH" ]; then
				if [ -z "$CLASSPATH" ]; then
					export CLASSPATH="$JAVA_HOME/lib/tools.jar"
				else
					export CLASSPATH="$CLASSPATH:$JAVA_HOME/lib/tools.jar"
				fi
				echo $CLASSPATH 1
			else
				export CLASSPATH="$JAVA_HOME/lib/tools.jar"
				echo $CLASSPATH 1
			fi
		fi
		echo $CLASSPATH 1
	else
		export J2SDKDIR="/usr/lib/jvm/java-7-oracle"
		if [ -e "$JAVA_HOME" ]; then
			if [ -z "$JAVA_HOME" ]; then
				export JAVA_HOME="$J2SDKDIR"
			fi
		else
			export JAVA_HOME="$J2SDKDIR"
		fi
		if [ -e "$DERBY_HOME" ]; then
			if [ -z "$DERBY_HOME" ]; then
				export DERBY_HOME="$J2SDKDIR/db"
			fi
		else
			export DERBY_HOME="$J2SDKDIR/db"
		fi
		#jre
		export J2REDIR="$J2SDKDIR/jre"
		if [ -e "$JRE_HOME" ]; then
			if [ -z "$JRE_HOME" ]; then
				export JRE_HOME="$J2REDIR"
			fi
		else
			export JRE_HOME="$J2REDIR"
		fi
		export PATH="$PATH:$J2SDKDIR/bin:$J2SDKDIR/db/bin:$J2REDIR/bin"
		# Java ClassPath
		if [ -e "$CLASSPATH" ]; then
			if [ -z "$CLASSPATH" ]; then
				export CLASSPATH="$JAVA_HOME/lib/tools.jar"
			else
				export CLASSPATH="$CLASSPATH:$JAVA_HOME/lib/tools.jar"
			fi
			echo $CLASSPATH 2
		else
			export CLASSPATH="$JAVA_HOME/lib/tools.jar"
			echo $CLASSPATH 2
		fi
		echo $CLASSPATH 2
	fi
fi
echo $CLASSPATH 3

# Java ClassPath
if [ -e "$CLASSPATH" ]; then
	if [ -z "$CLASSPATH" ]; then
		export CLASSPATH="$HOME/lib/mysql-connector-java-5.1.6-bin.jar"
		export CLASSPATH="$CLASSPATH:$HOME/lib/postgresql-9.3-1102.jdbc41.jar"
	else
		export CLASSPATH="$CLASSPATH:$HOME/lib/mysql-connector-java-5.1.6-bin.jar"
		export CLASSPATH="$CLASSPATH:$HOME/lib/postgresql-9.3-1102.jdbc41.jar"
	fi
	echo $CLASSPATH 4
else
	export CLASSPATH="$HOME/lib/mysql-connector-java-5.1.6-bin.jar"
	export CLASSPATH="$CLASSPATH:$HOME/lib/postgresql-9.3-1102.jdbc41.jar"
fi
echo $CLASSPATH 4
#CLASSPATH=$CLASSPATH:$HOME/lib/dom4j-1.6.1.jar

# Tomcat
if [ -d "$HOME/apache-tomcat-7.0.41" ]; then
	export CATALINA_HOME="$HOME/apache-tomcat-7.0.41"
	export PATH="$PATH:$CATALINA_HOME/bin"
fi

# Oracle 64
if [ -d "/usr/lib/oracle/12.1/client64" ]; then
	export ORACLE_HOME="/usr/lib/oracle/12.1/client64"
fi
# Oracle 32
if [ -d "/usr/lib/oracle/12.1/client" ]; then
	export ORACLE_HOME="/usr/lib/oracle/12.1/client"
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
	if [ -e "$CLASSPATH" ]; then
		echo existe
		if [ -z "$CLASSPATH" ]; then
			echo vazias
			export CLASSPATH="$ORACLE_HOME/lib/ojdbc7.jar"
			export CLASSPATH="$CLASSPATH:$ORACLE_HOME/lib/ojdbc6.jar"
		else
			echo cheia
			export CLASSPATH="$CLASSPATH:$ORACLE_HOME/lib/ojdbc7.jar"
			export CLASSPATH="$CLASSPATH:$ORACLE_HOME/lib/ojdbc6.jar"
		fi
		echo $CLASSPATH 6
	else
		echo não existe
	fi
	echo $CLASSPATH 7
fi
# Oracle TNS
if [ -d "$HOME/oracle_client/network/admin" ]; then
	export TNS_ADMIN="$HOME/oracle_client/network/admin"
fi

# copy drive
PATH="$PATH:/opt/copy/x86_64"
