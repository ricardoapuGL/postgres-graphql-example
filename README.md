# Postgraphile Example

A containerized example that creates a GraphQL API (with a graphiql interactive interface) from a running postgres instance.
See [docker-compose.yml](./docker-compose.yml) for the detail of the two services.

Other files of interest:

1. [./migrations/001.sql](./migrations/0001.sql): psql schema definition + initial seeds
2. [./index.ts](./index.ts): postgraphile server code in TypeScript
3. [postgraphile.Dockerfile](./postgraphile.Dockerfile): Dockerfile to containerize postgraphile server
4. [.env](.env): .env

## Usage

1. Install Docker
2. Check [001.sql](./migrations/0001.sql) and [.env](.env) files, modify if needed
3. Run docker compose up
4. Interact with the GraphiQL at http://localhost:3001/graphiql
