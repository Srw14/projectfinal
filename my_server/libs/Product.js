const mysql = require("mysql");

module.exports = {
    createProduct: async (pool, product_id, product_name,type,price,details) => {
        var sql = "INSERT INTO products (product_id, product_name,type,price,details)"
                    + "VALUES (?,?,?,?,?)";
        sql = mysql.format(sql, [product_id, product_name,type,price,details]);

        return await pool.query(sql);
    }
}