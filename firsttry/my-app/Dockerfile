FROM node:alpine AS build
WORKDIR /build
COPY ./package.json .
RUN ["npm", "install", "--prod"]

FROM node:alpine
WORKDIR /application
COPY ./dist .
COPY --from=build /build/node_modules ./node_modules

ENTRYPOINT [ "node", "main" ]