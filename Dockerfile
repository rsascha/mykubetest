FROM nginx:alpine

ENTRYPOINT ["nginx", "-g", "daemon off;"]
