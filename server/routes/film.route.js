// home.route.js
var express = require('express');
var router = express.Router();
var filmService = require('../services/film.service');
var passport = require('passport');

// Bring in defined Passport Strategy
require('../config/passport')(passport);

/*
    Get list filmr
*/
router.get('/getListFilms', (req, res, next) => {
    filmService.getListFilms().then(function(response) {
        res.status(200).json(response);
    }).catch((err) => {
        res.status(500).send(false);
    });;
});

module.exports = router;