FROM node:16-alpine

WORKDIR /var/www


COPY package*.json ./
RUN npm install
RUN npm update

COPY . .

ENV HOST 0.0.0.0
EXPOSE 8080
EXPOSE 9229


CMD [ "npm", "run", "serve" ]
