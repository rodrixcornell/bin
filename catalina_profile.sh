#!/bin/bash
## Tomcat
#unset CATALINA_HOME CATALINA_BASE CATALINA_TMPDIR CLASSPATH
if [ -d "$HOME/apache-tomcat-7.0.41" ]; then
	export CATALINA_HOME="$HOME/apache-tomcat-7.0.41"
	export CATALINA_BASE="$CATALINA_HOME"
	export CATALINA_TMPDIR="$CATALINA_HOME"
	export PATH="$PATH:$CATALINA_HOME/bin"
	export CLASSPATH="$CLASSPATH:$CATALINA_HOME/bin/bootstrap.jar:$CATALINA_HOME/bin/tomcat-juli.jar"
fi
