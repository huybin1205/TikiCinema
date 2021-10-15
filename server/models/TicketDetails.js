/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('TicketDetails', {
		Id: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
        Ticket_Id: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        Seat_Id: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        Price: {
            type: DataTypes.INTEGER,
            allowNull: true
        },	
		Deleted: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		timestamps: false,
		tableName: 'TicketDetails'
	});
};
