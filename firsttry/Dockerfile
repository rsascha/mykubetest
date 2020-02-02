FROM nginx:alpine

COPY ./nginx/usr/share/nginx/html /usr/share/nginx/html
COPY ./nginx/etc/nginx/conf.d/default.conf /etc/nginx/conf.d

ENTRYPOINT ["nginx", "-g", "daemon off;"]
