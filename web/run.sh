#!/bin/bash

if [ ! -f /.tomcat_admin_created ]; then
    /create_tomcat_admin_user.sh
fi

if [ -f /data/config.sh ]; then
    source /data/config.sh
fi

exec ${CATALINA_HOME}/bin/catalina.sh run
