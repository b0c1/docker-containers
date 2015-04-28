Apache Spark 1.2.2 on Docker
==========
The repository based on [sequenceiq/hadoop-docker image](https://registry.hub.docker.com/u/sequenceiq/hadoop-docker/)
Current hadoop version 2.6.0

## Testing

You can run one of the stock examples:

```
cd /usr/local/spark
# run the spark shell
./bin/spark-shell --master yarn-client --driver-memory 1g --executor-memory 1g --executor-cores 1

# execute the the following command which should return 1000
scala> sc.parallelize(1 to 1000).count()
```

There are two deploy modes that can be used to launch Spark applications on YARN. In yarn-cluster mode, the Spark driver runs inside an application master process which is managed by YARN on the cluster, and the client can go away after initiating the application. In yarn-client mode, the driver runs in the client process, and the application master is only used for requesting resources from YARN.

Estimating Pi (yarn-cluster mode): 

```
cd /usr/local/spark

# execute the the following command which should write the "Pi is roughly 3.1418" into the logs
./bin/spark-submit --class org.apache.spark.examples.SparkPi --master yarn-cluster --driver-memory 1g --executor-memory 1g --executor-cores 1 examples/target/scala-2.10/spark-examples_2.10-1.0.1.jar
```

Estimating Pi (yarn-client mode):

```
cd /usr/local/spark

# execute the the following command which should print the "Pi is roughly 3.1418" to the screen
./bin/spark-submit --class org.apache.spark.examples.SparkPi --master yarn-client --driver-memory 1g --executor-memory 1g --executor-cores 1 examples/target/scala-2.10/spark-examples_2.10-1.0.1.jar
```
