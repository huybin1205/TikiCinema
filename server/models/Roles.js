/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('Roles', {
		Id: {
			type: DataTypes.INTEGER,
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		RoleName: {
			type: DataTypes.STRING,
			allowNull: true
		},
		Deleted: {
			type: DataTypes.BOOLEAN,
			allowNull: false
		}
	}, {
		timestamps: false,
		tableName: 'Roles'
	});
};
