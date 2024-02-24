FROM node:20-alpine

RUN apk add --no-cache curl jq

WORKDIR /usr/src/app
COPY gen/srv .
RUN npm install

EXPOSE 9004 9003 8080
USER node
CMD [ "npm", "start" ]