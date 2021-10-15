/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('Seats', {
		Id: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
        MovieTheater_Id: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        VerticalSeatRow: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        HorizontalSeatRow: {
            type: DataTypes.INTEGER,
            allowNull: true
        },	
		Status: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		},
		Deleted: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		timestamps: false,
		tableName: 'Seats'
	});
};
