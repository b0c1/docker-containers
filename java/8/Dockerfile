FROM ubuntu:latest
MAINTAINER Janos Haber <janos.haber@finesolution.hu>

# Install Oracle Java 8
ENV JAVA_VER 8
ENV JAVA_VERSION 8u45

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:webupd8team/java && \
    apt-get update

RUN apt-get purge openjdk*
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer
