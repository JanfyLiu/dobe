FROM node:4.3.1

RUN npm install -g nodemon cnpm gulp bower && npm cache clear

# Write Permission
RUN usermod -u 1000 www-data

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

#CMD ["npm", "start"]

WORKDIR /opt

VOLUME ["/opt"]

EXPOSE 8080
