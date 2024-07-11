import app from './app';
Bun.serve({
  hostname: "localhost",
  fetch: app.fetch,
});
console.log("Hello via Bun!");