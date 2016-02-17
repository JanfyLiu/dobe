FROM wendal/ssdb

ADD ./ssdb.conf /etc/ssdb.conf

EXPOSE 8888

VOLUME ["/var/lib/ssdb"]

ENTRYPOINT /usr/bin/ssdb-server /etc/ssdb.conf
