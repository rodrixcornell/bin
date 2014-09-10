#!/bin/bash
# Tomcat init-script

VER="7.0.41"
HOME="/home/cabral"
CATALINA_HOME="/home/cabral/apache-tomcat-$VER"

$HOME/bin/java_profile.sh
$HOME/bin/catalina_profile.sh
$HOME/bin/classpath_profile.sh
$HOME/bin/oracle_profile.sh

echo ">>> Tomcat verão: $VER <<<"

case $1 in
start)
	$CATALINA_HOME/bin/startup.sh
;;
stop)
	$CATALINA_HOME/bin/shutdown.sh
;;
esac
exit 0
