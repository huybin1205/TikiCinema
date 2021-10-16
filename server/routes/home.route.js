// home.route.js
var express = require('express');
var router = express.Router();
var homeService = require('../services/home.service');
var passport = require('passport');

// Bring in defined Passport Strategy
require('../config/passport')(passport);

/*
    Get list cinemar
*/
router.get('/getListCinemar', (req, res, next) => {
    homeService.getListCinemar().then(function(response) {
        res.status(200).json(response);
    }).catch((err) => {
        res.status(500).send(false);
    });;
});

module.exports = router;