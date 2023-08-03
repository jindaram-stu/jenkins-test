FROM node:14.17.0-alpine as builder

WORKDIR /webapp

COPY package.json ./
RUN npm install

COPY public ./public
COPY src ./src
COPY nginx.conf ./

RUN npm run build
FROM nginx:stable-alpine

COPY --from=builder ./webapp/dist /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=builder ./webapp/nginx.conf /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
