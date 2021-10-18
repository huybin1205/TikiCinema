// Film.service.js
const DataTypes = require('sequelize');
var sequelize = require('../models/db');
var jwt = require('jsonwebtoken');
var passport = require('passport');

/**
    insert Ticket
**/
exports.insertTicket = (ticket) => {
    return sequelize.query(`EXEC InsertTicket @Film_Id=${ticket.Film_Id}, @Cinema_Id=${ticket.Cinema_Id},@User_Id=${ticket.User_Id},@GroupTicket=${ticket.GroupTicket}, @ListId='${ticket.ListId}'`, { type: sequelize.QueryTypes.SELECT })
}
