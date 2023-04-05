import 'dotenv/config';
import express from 'express';
import mysql from "mysql2/promise";

import {configs} from "./db";

const createServer = async () => {
  await mysql.createConnection(configs.db);
  const app = express();
  const port = process.env.NODE_LOCAL_PORT || 4000;

  app.listen(port, () => {
    console.log(`\x1b[34m[<<Successfully>>]\x1b[0m: server works - http://localhost:${port}`);
  });
}

createServer()
  .catch(console.log);
