Apache Spark 1.3.1 on Docker
==========
The repository based on [sequenceiq/hadoop-ubuntu:2.6.0 image](https://registry.hub.docker.com/u/sequenceiq/hadoop-ubuntu/)
Current hadoop ubuntu version 2.6.0

Can start Hadoop or Spark cluster

environment variable ```SPARK_MODE```:
```spark```     - run spark master and worker
```none```      - doesn't  run spark or hadoop
```default```   - start hadoop cluster

Spark Mode opened ports:
```
SPARK_WORKER_PORT=8082
SPARK_WORKER_WEBUI_PORT=8081
SPARK_MASTER_PORT=7077
SPARK_MASTER_WEBUI_PORT=8080
```

If you run the /etc/spark-bootstrap.sh with -d option (default CMD) it will check the /data/deploy.sh script and try to start.
If you using -bash option, you will get shell.
