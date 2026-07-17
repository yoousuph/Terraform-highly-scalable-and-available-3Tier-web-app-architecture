// module.exports = Object.freeze({
//     DB_HOST : 'localhost',
//     DB_USER : 'root',
//     DB_PWD : 'YusSql@58',
//     DB_DATABASE : 'webapp'
// });


module.exports = Object.freeze({
    DB_HOST : "${rds_address}:${rds_port}",
    DB_USER : "${db_username}",
    DB_PWD : "${db_password",
    DB_DATABASE : "${db_name}"
});
