FROM node:18-alpine as base
ENV LANG en_US.utf8
LABEL description="Instant high-performance GraphQL API for your PostgreSQL database https://github.com/graphile/postgraphile"

# Set Node.js app folder
RUN mkdir -p /home/node/app/node_modules
WORKDIR /home/node/app

# Copy dependencies
COPY ./package*.json .
RUN chown -R node:node /home/node/app

# Install dependencies
USER node
RUN npm install

# Copy application files
COPY --chown=node:node dist/*.js .

EXPOSE 3001
CMD [ "node", "./index.js" ]