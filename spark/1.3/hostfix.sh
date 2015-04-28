#!/bin/sh

HOSTNAME=`hostname -f`
sed -i -r "s/\{\{hostname}}/${HOSTNAME}/g" /usr/local/spark/yarn-remote-client/core-site.xml
sed -i -r "s/\{\{hostname}}/${HOSTNAME}/g" /usr/local/spark/yarn-remote-client/yarn-site.xml
