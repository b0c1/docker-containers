#!/bin/bash

if [ ! -f /.tomcat_admin_created ]; then
    /create_tomcat_admin_user.sh
fi

source /data/config.sh

exec ${CATALINA_HOME}/bin/catalina.sh run
