#!/bin/sh

HOSTNAME=`hostname -f`
echo "Hostname: ${HOSTNAME}"
sed -i -r "s/\{\{hostname}}/${HOSTNAME}/g" /usr/local/spark/yarn-remote-client/core-site.xml
sed -i -r "s/\{\{hostname}}/${HOSTNAME}/g" /usr/local/spark/yarn-remote-client/yarn-site.xml
