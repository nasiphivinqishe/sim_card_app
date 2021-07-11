require("dotenv").config();
const mysql = require('mysql');

const db_connection = mysql.createConnection({
    host: process.env.DATABASE_HOST,
    user: process.env.DATABASE_USER,
    password: process.env.DATABASE_PASSWORD,
    database: process.env.DATABASE_NAME
});

db_connection.connect(function (err) {
    if (err) throw err;
});

module.exports = db_connection;