#!/bin/bash

export TNS_ADMIN="$HOME/oracle_client/network/admin"

export JAVA_HOME="/usr/lib/jvm/java-7-oracle"
export J2SDKDIR="$JAVA_HOME"
export J2REDIR="$JAVA_HOME/jre"
export DERBY_HOME="$JAVA_HOME/db"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$J2SDKDIR/lib:$J2REDIR/lib:$DERBY_HOME/lib"
export PATH="$PATH:$J2SDKDIR/bin:$J2REDIR/bin:$DERBY_HOME/bin"

export CLASSPATH="$JAVA_HOME/lib/tools.jar:$HOME/lib/mysql-connector-java-5.1.6-bin.jar:$HOME/lib/postgresql-9.3-1102.jdbc41.jar:$HOME/lib/ojdbc7.jar"

#export ORACLE_SID="XE"
#export ORACLE_BASE="/u01/app/oracle"
#export ORACLE_HOME="$ORACLE_BASE/product/11.2.0/xe"
export ORACLE_HOME="/opt/oracle/instantclient_11_2"
#export NLS_LANG="$ORACLE_HOME/bin/nls_lang.sh"
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$ORACLE_HOME/lib"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$ORACLE_HOME"
#export PATH="$PATH:$ORACLE_HOME/bin"
export PATH="$PATH:$ORACLE_HOME"

#export JRECLASSPATH="$ORACLE_HOME/jdbc/lib/ojdbc5.jar:$ORACLE_HOME/jlib/orai18n.jar:$ORACLE_HOME/precomp/lib/ottclasses.zip"

#export ORACLE_INSTANTCLIENT="/usr/lib/oracle/12.1/client64"
#export LD_LIBRARY_PATH="$ORACLE_INSTANTCLIENT/lib:$LD_LIBRARY_PATH"
#export PATH="$ORACLE_INSTANTCLIENT/bin:$PATH"
