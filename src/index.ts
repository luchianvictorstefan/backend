import app from './app';
console.log("Hello via Bun!");
Bun.serve({
  port: 8080,
  hostname: "localhost",
  fetch: app.fetch,
});