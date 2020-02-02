# We should use a small image like alpine, but for now ...
FROM node

WORKDIR /application
COPY --chown=node:node ./dist/apps/api .
# We don't need all node modules, but for now we copy all ...
COPY --chown=node:node ./node_modules ./node_modules

ENV port=80
EXPOSE 80
ENTRYPOINT [ "node", "main" ]
