/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('MovieTheaters', {
		Id: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
        Cinema_Id: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        Name: {
            type: DataTypes.STRING,
            allowNull: true
        },
        HorizontalSeats: {
            type: DataTypes.INTEGER,
            allowNull: true
        },
        VerticalSeats: {
            type: DataTypes.INTEGER,
            allowNull: true
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
		tableName: 'MovieTheaters'
	});
};
