##
FROM node:10.9.0-alpine
RUN npm install -g yo generator-keystone docker-override@0.1.2

##
ENV MONGO_URI=mongodb://mongo/keystone

##
USER node
RUN cd /home/node/ && yo keystone auto \
 && mv keystone-starter keystone && cd /home/node/keystone \
 && npm install node-sass-middleware --save
COPY .docker-override.json /home/node/.docker-override.json

##
WORKDIR /home/node/keystone
COPY foreground.sh /usr/local/bin/foreground.sh
CMD ["foreground.sh"]
