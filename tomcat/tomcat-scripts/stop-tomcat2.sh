#!/bin/bash

# Define Tomcat paths
export CATALINA_HOME="/Users/rae-anandres/CATALINA_HOME/tomcat/tomcat2"
export CATALINA_BASE="$CATALINA_HOME"
export CATALINA_PID=$CATALINA_BASE/logs/tomcat.pid
export CATALINA_OUT=$CATALINA_BASE/logs/catalina.out

cd ..


# give permission
chmod +x $CATALINA_BASE/bin/*.sh

# Stop Tomcat
echo "Stopping Tomcat Instance 2..."
$CATALINA_BASE/bin/shutdown.sh


# Print matches directly
grep "ERROR" $CATALINA_HOME/logs/catalina.out

# Store in a variable and print
log_errors=$(grep "ERROR" /Users/rae-anandres/CATALINA_HOME/tomcat/tomcat1/logs/catalina.out)
echo "$log_errors"