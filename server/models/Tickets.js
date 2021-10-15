/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('Tickets', {
		Id: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
        Film_Id: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        Cinema_Id: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        User_Id: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
		GroupTicket: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		},
		CreateDate: {
			type: DataTypes.DATE,
			allowNull: true
		},
		Deleted: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		timestamps: false,
		tableName: 'Tickets'
	});
};
