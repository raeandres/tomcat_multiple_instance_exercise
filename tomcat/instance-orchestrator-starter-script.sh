#!/bin/bash

#Init; 
TOMCAT_SCRIPTS=tomcat-scripts

#Give permission to run all the scripts inside /tomcat-scripts directory
chmod u+x tomcat-scripts/*.sh

INSTANCE1="tomcat1"
INSTANCE2="tomcat2"
INSTANCE3="tomcat3"

START_INSTANCE1="$TOMCAT_SCRIPTS/start-tomcat1.sh"
START_INSTANCE2="$TOMCAT_SCRIPTS/start-tomcat2.sh"
START_INSTANCE3="$TOMCAT_SCRIPTS/start-tomcat3.sh"

STOP_INSTANCE1="$TOMCAT_SCRIPTS/stop-tomcat1.sh"
STOP_INSTANCE2="$TOMCAT_SCRIPTS/stop-tomcat2.sh"
STOP_INSTANCE3="$TOMCAT_SCRIPTS/stop-tomcat3.sh"


# Check the DEPLOYMENTS Directory for any WAR File - copy to webapps if existing
# WAR file must be inside of webapps folder first before starting the instance

FILENAME="sample"


# Copy all files  before starting the instance 
if [ -f "/DEPLOYMENTS/$FILENAME.war" ]; then
    cp "/DEPLOYMENTS/$FILENAME.war /$INSTANCE1/webapps/"
    echo "$FILENAME file has been deployed to $INSTANCE1"
else
    echo "$FILENAME not existing"
    exist 1
fi

echo "Starting instances..."
echo "Starting Instance 1"
$START_INSTANCE1
# ./tomcat1/bin/startup.sh


echo "Checking instance status before starting the next instance..."
sleep 2


# Copy all files  before starting the instance 
if [ -f "/DEPLOYMENTS/$FILENAME.war" ]; then
    cp "/DEPLOYMENTS/$FILENAME.war /$INSTANCE2/webapps/"
    echo "$FILENAME file has been deployed to $INSTANCE2"
else
    echo "$FILENAME not existing"
    exist 1
fi

echo "Starting Instance 2"
$START_INSTANCE2
# ./tomcat2/bin/startup.sh

echo "Checking instance status before starting the next instance..."
sleep 2

# Copy all files  before starting the instance 
if [ -f "/DEPLOYMENTS/$FILENAME.war" ]; then
    cp "/DEPLOYMENTS/$FILENAME.war /$INSTANCE3/webapps/"
    echo "$FILENAME file has been deployed to $INSTANCE3"
 else
    echo "$FILENAME not existing"
    exist 1
fi

echo "Starting Instance 3"
$START_INSTANCE3
# ./tomcat3/bin/startup.sh

echo "Last instance started. checking all instances..."
sleep 2


