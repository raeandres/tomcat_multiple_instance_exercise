#!/bin/bash

#Define routes
export CATALINA_HOME="/Users/rae-anandres/CATALINA_HOME/tomcat/tomcat1"
export CATALINA_BASE="$CATALINA_HOME"
export CATALINA_PID=$CATALINA_BASE/logs/tomcat.pid
export CATALINA_OUT=$CATALINA_BASE/logs/catalina.out

# Remove stale PID file if it exists
if [ -f "$CATALINA_PID" ]; then
    if ! ps -p $(cat "$CATALINA_PID") > /dev/null 2>&1; then
        echo "Removing stale PID file..."
        rm "$CATALINA_PID"
    fi
fi

cd ..

# give permission
chmod +x $CATALINA_BASE/bin/*.sh

# Start Tomcat
echo "Starting Tomcat instance 1"
$CATALINA_BASE/bin/startup.sh


# Print matches directly
grep "ERROR" $CATALINA_HOME/logs/catalina.out

# Store in a variable and print
log_errors=$(grep "ERROR" /Users/rae-anandres/CATALINA_HOME/tomcat/tomcat1/logs/catalina.out)
echo "$log_errors"