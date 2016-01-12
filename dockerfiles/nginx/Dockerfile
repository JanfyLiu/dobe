FROM nginx:1.9.0

ADD nginx.conf /etc/nginx/nginx.conf
ADD sites-enabled/* /etc/nginx/conf.d/
RUN mkdir /opt/htdocs /opt/log /opt/log/nginx \
    && chown -R www-data.www-data /opt

EXPOSE 80
VOLUME ["/opt"]
