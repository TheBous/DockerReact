FROM node:14-alpine
LABEL maintainer="TheBous thebous1993@gmail.com"

ADD nginx.conf /etc/nginx/conf.d/nginx.conf

RUN apk add --no-cache git
RUN apk --update add nginx
RUN apk add openrc --no-cache

ADD package.json /tmp/package.json
RUN echo 🚨 Install deps...
RUN cd /tmp && yarn add silent
RUN mkdir -p /var/www/ && cp -a /tmp/node_modules /var/www/

WORKDIR /var/www/
ADD . /var/www/
RUN mkdir -p /run/nginx
RUN nginx -t
# RUN /etc/init.d/nginx restart

CMD yarn start:watch
