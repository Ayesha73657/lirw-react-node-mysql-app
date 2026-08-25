const mysql = require('mysql2');

const db = mysql.createConnection({
  host: 'mysql',
  port: 3306,
  user: 'appuser',
  password: 'app123',
  database: 'taskdb'
});

module.exports = db;