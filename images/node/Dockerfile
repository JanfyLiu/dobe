FROM node:5.6

#RUN npm install -g nodemon cnpm gulp bower && npm cache clear

COPY server.js /opt/server.js

WORKDIR /opt

VOLUME ["/opt"]

#ENTRYPOINT [ "node", "server.js" ]

#CMD ["npm", "start"]

EXPOSE 8001
