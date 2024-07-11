import app from './app';
console.log("Hello via Bun!");
Bun.serve({
  port: 3000,
  hostname: "localhost",
  fetch: app.fetch,
});