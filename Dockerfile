FROM nginx:alpine

COPY ./nginx/usr/share/nginx/html /usr/share/nginx/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]
