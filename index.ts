#!/usr/bin/env -S npx ts-node
import { createServer } from "http";
import { Pool } from "pg";
import { PostGraphileOptions, postgraphile } from "postgraphile";
import "dotenv/config";
import { createLogger } from "bunyan";
export const logger = createLogger({name: "graphql-postgres"});

// Connection string (or pg.Pool) for PostGraphile to use
logger.info(`process.env.DATABASE_URL: ${process.env.DATABASE_URL}`);

export const database: string | Pool =
  process.env.DATABASE_URL || "postgraphile";
logger.info(`database Pool | string: ${database}`);

export const schemas: string | string[] = process.env.SCHEMA ||["public"];
logger.info(`schemas string: ${schemas}`);
// PostGraphile options; see https://www.graphile.org/postgraphile/usage-library/#api-postgraphilepgconfig-schemaname-options
export const options: PostGraphileOptions = {
  watchPg: true,
  graphiql: true,
  enhanceGraphiql: true,
  subscriptions: true,
  dynamicJson: true,
  setofFunctionsContainNulls: false,
  ignoreRBAC: false,
  showErrorStack: "json",
  extendedErrors: ["hint", "detail", "errcode"],
  allowExplain: true,
  legacyRelations: "omit",
  sortExport: true
};

export const port: number = process.env.PORT
  ? parseInt(process.env.PORT, 10)
  : 3001;
logger.info(`port: ${port}`)
const middleware = postgraphile(database, schemas, options);

const server = createServer(middleware);

server.listen(port);
