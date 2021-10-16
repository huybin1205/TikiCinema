// home.route.js
var express = require('express');
var router = express.Router();
var cinemaService = require('../services/cinema.service');
var passport = require('passport');

// Bring in defined Passport Strategy
require('../config/passport')(passport);

/*
    Get list cinemar
*/
router.get('/getListCinemas', (req, res, next) => {
    cinemaService.getListCinemas().then(function(response) {
        res.status(200).json(response);
    }).catch((err) => {
        res.status(500).send(false);
    });;
});

module.exports = router;