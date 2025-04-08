const { createPool } = require("mysql");


const connected = createPool({
  host: "localhost",
  user: "root",
  database: "gold-trading-v1",
  password: "",
});

// const pool = createPool({
//   host: "",
//   user: "",
//   database: "",
//   password: "",
// });

module.exports = connected;