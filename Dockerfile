FROM node:14-alpine
LABEL maintainer="TheBous thebous@gmail.com"

WORKDIR /src
ADD package.json /src 
RUN apk add --no-cache git
RUN yarn --silent
ADD . /src  
CMD yarn client:watch
