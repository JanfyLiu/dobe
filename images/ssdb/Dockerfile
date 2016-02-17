FROM ubuntu:14.04

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

COPY ./sources.list /etc/apt/sources.list
RUN apt-get update && apt-get install -y \
  make \
  gcc \
  git \
  g++ \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/ideawu/ssdb.git ssdb \
  && cd ssdb && make && make install \
  && cp ssdb-server /usr/bin \
  && cp ssdb.conf /etc \
  && cd .. && yes | rm -r ssdb

RUN mkdir -p /var/lib/ssdb && \
  sed \
    -e 's@home.*@home /var/lib@' \
    -e 's/loglevel.*/loglevel info/' \
    -e 's@work_dir = .*@work_dir = /var/lib/ssdb@' \
    -e 's@pidfile = .*@pidfile = /run/ssdb.pid@' \
    -e 's@level:.*@level: info@' \
    -e 's@ip:.*@ip: 0.0.0.0@' \
    -e 's@port:.*@port: 16379@' \
    -i /etc/ssdb.conf

EXPOSE 16379
VOLUME /var/lib/ssdb
ENTRYPOINT ["/usr/bin/ssdb-server","/etc/ssdb.conf"]
