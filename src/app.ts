// src/app.ts
import express from 'express';
import { rpcHandler } from "typed-rpc/lib/express";
const app = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello, TypeScript with Express!');
});
// app.post("/api", rpcHandler(Service));
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});