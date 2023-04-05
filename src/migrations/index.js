import migration from "mysql-migrations";
import mysql from "mysql2/promise";

import {configs} from "../db";

migration.init(mysql.createConnection(configs.db), __dirname, './migrations', {}, () => {
  console.log("\x1b[34m[<<Migrations>>]\x1b[0m finished!!!");
});
