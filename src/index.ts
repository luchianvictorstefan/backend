import app from './app';
console.log("Hello via Bun!");
Bun.serve({
  port: 3000,
  hostname: "0.0.0.0",
  fetch: app.fetch,
});