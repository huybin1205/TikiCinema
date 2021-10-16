// kindOfSeat.service.js
const DataTypes = require('sequelize');
var sequelize = require('../models/db');
var passport = require('passport');

/**
    * Get list MovieTheater
**/
exports.getListKindOfSeats = () => {
    return sequelize.query(`EXEC GetListKindOfSeats`, { type: sequelize.QueryTypes.SELECT })
}
