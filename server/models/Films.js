/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('Films', {
		Id: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		Name: {
			type: DataTypes.STRING,
			allowNull: true
		},
		Image: {
			type: DataTypes.STRING,
			allowNull: true
		},
		Description: {
			type: DataTypes.STRING,
			allowNull: true
		},
        Category_Id: {
			type: DataTypes.INTEGER,
			allowNull: true
		},
		Author: {
			type: DataTypes.STRING,
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
		tableName: 'Films'
	});
};
