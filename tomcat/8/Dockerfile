FROM b0c1/java:8
MAINTAINER Janos Haber <janos.haber@finesolution.hu>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget pwgen unzip maven git

ENV TOMCAT_MAIN_VERSION 8
ENV TOMCAT_VERSION 8.0.22
ENV CATALINA_HOME /tomcat

# INSTALL TOMCAT
RUN wget http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAIN_VERSION}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O tomcat.tar.gz
RUN tar zxf tomcat.tar.gz && rm tomcat.tar.gz && mv apache-tomcat* /tomcat
RUN rm -rf /tomcat/webapps/ROOT*

VOLUME ["/data"]

ADD create_tomcat_admin_user.sh /create_tomcat_admin_user.sh
ADD run.sh /run.sh
RUN chmod +x /*.sh

# Build and install PSI probe

RUN cd /tmp; git clone https://github.com/psi-probe/psi-probe;cd psi-probe; mvn package; mv web/target/probe.war /tomcat/webapps/probe.war
RUN rm -rf /tmp/psi-probe

EXPOSE 8080

CMD ["/run.sh"]
