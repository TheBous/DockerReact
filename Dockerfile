FROM node:14-alpine
LABEL maintainer="TheBous thebous1993@gmail.com"

RUN apk add --no-cache git
RUN apk --update add nginx

ADD package.json /tmp/package.json
RUN echo install deps 🚨
RUN cd /tmp && yarn add silent
RUN mkdir -p /opt/app && cp -a /tmp/node_modules /opt/app/

WORKDIR /opt/app
ADD . /opt/app

CMD yarn client:watch