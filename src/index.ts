import app from './app';
Bun.serve({
  port: 8080,
  hostname: "localhost",
  fetch: app.fetch,
});
console.log("Hello via Bun!");