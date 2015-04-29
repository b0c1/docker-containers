FROM sequenceiq/hadoop-ubuntu:2.6.0
MAINTAINER Janos Haber <janos.haber@finesolution.hu>

ENV SPARK_VERSION 1.1.1
ENV HADOOP_VERSION 2.4
ENV SPARK_ASSEMBLY_JAR spark-assembly-$SPARK_VERSION-hadoop$HADOOP_VERSION.0.jar
ENV SPARK_DOWNLOAD_NAME spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION

RUN apt-get install -y curl tar gzip
RUN curl -s http://www.us.apache.org/dist/spark/spark-$SPARK_VERSION/$SPARK_DOWNLOAD_NAME.tgz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s $SPARK_DOWNLOAD_NAME spark
RUN mkdir /usr/local/spark/yarn-remote-client
ADD yarn-remote-client /usr/local/spark/yarn-remote-client
ADD hostfix.sh /etc/hostfix.sh
ADD spark-bootstrap.sh /etc/spark-bootstrap.sh
RUN chmod ug=rwx /etc/spark-bootstrap.sh
RUN chmod ug=rwX /etc/hostfix.sh
RUN /bin/bash /etc/hostfix.sh

RUN $BOOTSTRAP && $HADOOP_PREFIX/bin/hadoop dfsadmin -safemode leave && $HADOOP_PREFIX/bin/hdfs dfs -put /usr/local/$SPARK_DOWNLOAD_NAME/lib /spark

ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV SPARK_JAR hdfs:///spark/$SPARK_ASSEMBLY_JAR

EXPOSE 50020 50090 50070 50010 50075 8031 8032 8033 8040 8042 49707 22 8088 8030

CMD ["/etc/spark-bootstrap.sh", "-d"]
