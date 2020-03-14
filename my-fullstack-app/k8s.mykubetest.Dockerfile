FROM nginx:alpine
WORKDIR /application
COPY --chown=root:root ./k8s.mykubetest.nginx.default.conf /etc/nginx/conf.d/default.conf
COPY --chown=root:root ./dist/apps/mykubetest /application
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]
