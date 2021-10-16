// home.route.js
var express = require('express');
var router = express.Router();
var kindOfSeatService = require('../services/kindOfSeat.service');
var passport = require('passport');

// Bring in defined Passport Strategy
require('../config/passport')(passport);

/*
    Get list kind of seats
*/
router.get('/getListKindOfSeats', (req, res, next) => {
    kindOfSeatService.getListKindOfSeats().then(function(response) {
        res.status(200).json(response);
    }).catch((err) => {
        res.status(500).send(false);
    });;
});

module.exports = router;