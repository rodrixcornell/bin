#!/bin/bash
## Java
# jdk
#unset J2SDKDIR JAVA_HOME J2REDIR JRE_HOME DERBY_HOME CLASSPATH
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
			# jre
			export J2REDIR="$J2SDKDIR/jre"
			if [ -e "$JRE_HOME" ]; then
				if [ -z "$JRE_HOME" ]; then
					export JRE_HOME="$J2REDIR"
				fi
			else
				export JRE_HOME="$J2REDIR"
			fi
			# path
			export PATH="$PATH:$J2SDKDIR/bin:$J2SDKDIR/db/bin:$J2REDIR/bin"
			# derby
			if [ -e "$DERBY_HOME" ]; then
				if [ -z "$DERBY_HOME" ]; then
					export DERBY_HOME="$J2SDKDIR/db"
				fi
			else
				export DERBY_HOME="$J2SDKDIR/db"
			fi
			# classpath
			if [ -e "$CLASSPATH" ]; then
				if [ -z "$CLASSPATH" ]; then
					export CLASSPATH="$J2SDKDIR/lib/tools.jar"
				else
					export CLASSPATH="$CLASSPATH:$J2SDKDIR/lib/tools.jar"
				fi
			else
				export CLASSPATH="$J2SDKDIR/lib/tools.jar"
			fi
		fi
	else
		export J2SDKDIR="/usr/lib/jvm/java-7-oracle"
		if [ -e "$JAVA_HOME" ]; then
			if [ -z "$JAVA_HOME" ]; then
				export JAVA_HOME="$J2SDKDIR"
			fi
		else
			export JAVA_HOME="$J2SDKDIR"
		fi
		# jre
		export J2REDIR="$J2SDKDIR/jre"
		if [ -e "$JRE_HOME" ]; then
			if [ -z "$JRE_HOME" ]; then
				export JRE_HOME="$J2REDIR"
			fi
		else
			export JRE_HOME="$J2REDIR"
		fi
		# path
		export PATH="$PATH:$J2SDKDIR/bin:$J2SDKDIR/db/bin:$J2REDIR/bin"
		# derby
		if [ -e "$DERBY_HOME" ]; then
			if [ -z "$DERBY_HOME" ]; then
				export DERBY_HOME="$J2SDKDIR/db"
			fi
		else
			export DERBY_HOME="$J2SDKDIR/db"
		fi
		# classpath
		if [ -e "$CLASSPATH" ]; then
			if [ -z "$CLASSPATH" ]; then
				export CLASSPATH="$J2SDKDIR/lib/tools.jar"
			else
				export CLASSPATH="$CLASSPATH:$J2SDKDIR/lib/tools.jar"
			fi
		else
			export CLASSPATH="$J2SDKDIR/lib/tools.jar"
		fi
	fi
fi