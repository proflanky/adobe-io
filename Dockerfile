FROM node:lts

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production

COPY . .

RUN aio plugins:install @adobe/aio-cli-plugin-cloudmanager

RUN aio plugins:update

EXPOSE 8080

CMD [ "node", "server.js" ]


