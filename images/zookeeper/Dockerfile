FROM java:openjdk-8-jre-alpine
MAINTAINER Justin Plock <justin@plock.net>

LABEL name="zookeeper" version="3.4.8"

RUN apk add --update wget bash
#RUN wget http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.8/zookeeper-3.4.8.tar.gz -O  /tmp/zookeeper-3.4.8.tar.gz
COPY ./zookeeper-3.4.8.tar.gz /tmp/zookeeper.tar.gz
RUN mkdir /opt && chmod 755 /opt && cd /opt \
    && tar -zxvf /tmp/zookeeper.tar.gz \
    && mv ./zookeeper-3.4.8 /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
    && mkdir -p /tmp/zookeeper

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

ENTRYPOINT ["/opt/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]
