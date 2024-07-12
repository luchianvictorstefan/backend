import { Hono } from 'hono';
import postgres from "postgres";

const config = {
  user: Bun.env.USERNAME,
  host: Bun.env.HOST,
  port: Number(Bun.env.PORT),
  pass: Bun.env.PASS,
  database: Bun.env.DATABASE,
}
const sql = postgres(config);
console.log(config)
const [{ version }] = await sql`SELECT version()`;
export const testRoute = new Hono()
.get('/', c => c.json({payload: [version]}))
.post('/', c => c.json({payload: []}))
.delete('/', c => c.json({payload: []}))
.patch('/', c => c.json({payload: []}));