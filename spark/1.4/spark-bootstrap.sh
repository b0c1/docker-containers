#!/bin/bash

echo "Start hadoop bootstrap..."
/etc/hostfix.sh
echo $1

case "$SPARK_MODE" in
    spark) echo "Start Spark Cluster"
          /usr/local/spark/sbin/start-all.sh
          ;;
    none)
         echo "Do not start HADOOP or Spark Cluster"
         ;;
    *) echo "Start HADOOP"
       /etc/bootstrap.sh
       ;;
esac

if [[ $1 == "-d" ]]; then
    echo "Check deploy script"
    if [ -e /data/deploy.sh ]; then
        echo "We have deploy script! Start it!"
        chown root:root /data/deploy.sh
        chmod 770 /data/deploy.sh
        /bin/bash /data/deploy.sh
	else
		echo "Deploy script (/data/deploy.sh) not found... /data content:"
		ls -la /data
    fi
fi

if [[ $1 == "-bash" ]]; then
  echo "Start bash"
  /bin/bash
fi
