import { drizzle } from "drizzle-orm/node-postgres";
import { Pool } from "pg";
import * as schema from "./schema";
import env from "../utils/env";
import { migrate } from "drizzle-orm/node-postgres/migrator";

export const connection = new Pool({
  connectionString: env.DATABASE_URL,
});

export const db = drizzle(connection, {
  schema,
  logger: true,
});

export type db = typeof db;

export default db;
if (env.DB_MIGRATING === true) {
  void migrate(db, { migrationsFolder: "src/db/migrations" });
}
