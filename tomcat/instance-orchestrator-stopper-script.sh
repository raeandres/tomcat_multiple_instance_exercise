#!/bin/bash

#Init; 

#Give permission to run all the scripts inside /tomcat-scripts directory
chmod u+x /tomcat-scripts*.sh


TOMCAT_SCRIPTS=tomcat-scripts

STOP_INSTANCE1="$TOMCAT_SCRIPTS/stop-tomcat1.sh"
STOP_INSTANCE2="$TOMCAT_SCRIPTS/stop-tomcat2.sh"
STOP_INSTANCE3="$TOMCAT_SCRIPTS/stop-tomcat3.sh"


echo "Stopping instances..."
echo "Stopping Instance 1"
$STOP_INSTANCE1
# ./tomcat1/bin/shutdown.sh
sleep 1
echo "Stopping Instance 2"
$STOP_INSTANCE2
# ./tomcat2/bin/shutdown.sh
sleep 1
echo "Stopping Instance 3"
$STOP_INSTANCE3
# ./tomcat3/bin/shutdown.sh
sleep 1


