import app from './app';
Bun.serve({
  hostname: "LOCALHOST",
  fetch: app.fetch,
});
console.log("Hello via Bun!");