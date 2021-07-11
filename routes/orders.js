const express = require('express')
const router = express.Router();
const db_connection = require("../db_connection")
const uuid = require('uuid');

router
    .get('/', (req, res) => {

        let { page, limit } = req.query

        try {
            if (isNaN(page)) {
                res.status(500).send({
                    success: false,
                    error: "Error: page needs to be a number"
                })

            } else if (isNaN(limit)) {
                res.status(500).send({
                    success: false,
                    error: "Error: limit needs to be a number"
                })
            } else if (parseInt(page) < 1) {
                res.status(500).send({
                    success: false,
                    error: "Error: page needs to start at 1"
                })
            } else {

                db_connection.query(`SELECT * FROM orders LIMIT ${limit} OFFSET ${page}`, (err, result) => {
                    if (err) {

                        console.error(err) //for debugging

                        res.status(500).send({
                            success: false,
                            error: err.sqlMessage
                        })
                    } else {
                        if (result.length == 0) {
                            res.status(200).send({
                                success: true,
                                data: []
                            })
                        } else {
                            res.status(200).send({
                                success: true,
                                data: result
                            })
                        }
                    }
                })
            }
        } catch (exception) {

            res.status(500).send({
                success: false,
                error: JSON.stringify(exception)
            })
        }
    })

router
    .post('/', (req, res) => {

        let { simdId, customerId, deliveryAddress } = req.body

        if (isNaN(simdId)) {
            res.status(500).send({
                success: false,
                error: "Error: simId needs to be a number"
            })

        } else if (isNaN(customerId)) {
            res.status(500).send({
                success: false,
                error: "Error: customerId needs to be a number"
            })
        } else {

            let orderId = uuid.v4()
            let status = "Pending"

            db_connection.query(`INSERT INTO orders(id, simId, customer_id, address, city, zip_code, country, status, createdAt) VALUES('${orderId}', ${simdId}, ${customerId}, '${deliveryAddress.address}', '${deliveryAddress.city}', '${deliveryAddress.zipCode}', '${deliveryAddress.country}', '${status}', NOW())`, (err, result) => {
                if (err) {

                    console.error(err) //for debugging

                    res.status(500).send({
                        success: false,
                        error: err.sqlMessage
                    })
                } else {
                    res.status(200).send({
                        success: true,
                        orderId: orderId,
                        status: "Pending"
                    })
                }
            })
        }

    })

router
    .put('/:id', (req, res) => {
        let { id } = req.params
        let { status } = req.body

        db_connection.query(`UPDATE orders SET status = '${status}' WHERE id = '${id}'`, (err, result) => {

            if (err) {

                console.error(err) //for debugging

                res.status(500).send({
                    success: false,
                    error: err.sqlMessage
                })
            } else {

                res.status(200).send({
                    success: true,
                    status: result.status

                })
            }
        })

    })



module.exports = router;