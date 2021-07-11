require("dotenv").config();
const mysql = require('mysql');
const express = require('express');
const app = express();
const PORT = process.env.PORT;
app.use(express.json());

const sim_cards = require('./routes/sim_cards')
app.use('/sim_cards', sim_cards);

const orders = require('./routes/orders')
app.use('/orders', orders);


app.listen(PORT, () => console.log(`Server started at http://localhost:${PORT} `))
