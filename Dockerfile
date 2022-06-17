FROM node:alpine

RUN mkdir  -p /usr/app
WORKDIR /usr/app

COPY ./package.json /usr/app/
RUN npm install

COPY . .

CMD ["npm", "start"]
