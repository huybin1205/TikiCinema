// Film.service.js
const DataTypes = require('sequelize');
var sequelize = require('../models/db');
var passport = require('passport');

/**
    * Get list films
**/
exports.getListFilms = () => {
    return sequelize.query(`EXEC GetListFilms`, { type: sequelize.QueryTypes.SELECT })
}
