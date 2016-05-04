FROM node:6.0.0

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]

CMD ["npm", "start"]

WORKDIR /opt

VOLUME ["/opt"]

EXPOSE 8080
