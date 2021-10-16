// cinema.service.js
const DataTypes = require('sequelize');
var sequelize = require('../models/db');
var passport = require('passport');

/**
    * Get list cinemas
**/
exports.getListCinemas = () => {
    return sequelize.query(`EXEC GetListCinemas`, { type: sequelize.QueryTypes.SELECT })
}
