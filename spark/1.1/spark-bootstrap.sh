#!/bin/bash

echo "Start hadoop bootstrap..."
echo $1
/etc/bootstrap.sh

if [[ $1 == "-d" ]]; then
    echo "Check deploy script"
    if [ -e /data/deploy.sh ]; then
        echo "We have deploy script! Start it!"
        chown root:root /data/deploy.sh
        chmod 770 /data/deploy.sh
        /bin/bash /data/deploy.sh
	else
		echo "Deploy script not found in data:"
		ls -la /data
    fi
    while true; do sleep 1000; done
fi

if [[ $1 == "-bash" ]]; then
  echo "Start bash"
  /bin/bash
fi
