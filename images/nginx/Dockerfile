FROM nginx:1.9.0

COPY ./nginx.conf /etc/nginx/
COPY ./ssl/* /usr/local/nginx/conf/

RUN chown -R www-data.www-data /opt

VOLUME ["/opt", "/var/log/nginx", "/etc/nginx/conf.d"]

EXPOSE 80 443
