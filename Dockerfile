FROM node:18.14

WORKDIR /webapp

COPY public ./public
COPY src ./src
COPY package.json ./package.json

RUN npm install
RUN npm run build

FROM nginx:stable-alpine

COPY ./build /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
