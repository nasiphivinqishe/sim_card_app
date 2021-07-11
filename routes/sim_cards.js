const express = require('express')
const router = express.Router();
const db_connection = require("../db_connection")

router
    .get('/', function (req, res) {

        db_connection.query("SELECT * FROM simcards", (err, result) => {
            if (err) {

                console.error(err) //for debugging

                res.status(500).send({
                    success: false,
                    error: err.sqlMessage
                })
            } else {
                res.status(200).send({
                    success: true,
                    data: result
                })
            }
        })


    })


module.exports = router;