// src/app.ts
import express from "express";
import { rpcHandler } from "typed-rpc/lib/express";
import { ApiService } from "./api/service";
const app = express();
const port = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Hello, TypeScript with Express!");
});
app.post("/api", rpcHandler(ApiService));
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
