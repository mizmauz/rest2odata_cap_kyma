FROM node:20-alpine

RUN apk add --no-cache curl jq

WORKDIR /usr/src/app
COPY gen/srv .

RUN npm install

EXPOSE 9005
USER node
CMD [ "npm", "start" ]