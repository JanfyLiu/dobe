FROM centos:7

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

WORKDIR /opt

VOLUME ["/opt"]

EXPOSE 1026
