#!/bin/bash
## Tomcat
if [ -d "$HOME/apache-tomcat-7.0.41" ]; then
	export CATALINA_HOME="$HOME/apache-tomcat-7.0.41"
	export PATH="$PATH:$CATALINA_HOME/bin"
fi
