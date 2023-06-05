FROM node:18-alpine as base
ENV LANG en_US.utf8
LABEL description="Instant high-performance GraphQL API for your PostgreSQL database https://github.com/graphile/postgraphile"
# Copy dependencies
WORKDIR /home/node/app
RUN mkdir /home/node/app/node_modules
COPY ./package.json ./package-lock.json ./
RUN chown -R node:node /home/node/app
RUN npm install

FROM base as build
COPY ./index.ts ./tsconfig.json ./
RUN npx tsc --outDir /tmp/build

FROM base as runtime
USER node
WORKDIR /home/node/app
COPY --from=build --chown=node:node /tmp/build/index.js .
EXPOSE 3001
CMD [ "npx", "node", "index.js" ]