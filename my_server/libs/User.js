const mysql = require("mysql");

module.exports = {

    registerUser: async (pool,name,email,password,) => {
        var sql = "INSERT INTO user (name,email,password)"
                + "VALUES (?,?,?)";

            sql = mysql.format(sql,[name,email,password]);

            return await pool.query(sql);
    },

    login: async(pool,email,password) => {
        try {
            const sql = "SELECT * FROM user WHERE email = ? AND password = ?";
            const inserts = [email, password];
            const query = mysql.format(sql, inserts);

            const result = await pool.query(query);

            if (result.length > 0) {
                // ลงชื่อเข้าใช้งานสำเร็จ
                return { success: true, user: result[0] };
            } else {
                // ลงชื่อเข้าใช้งานไม่สำเร็จ
                return { success: false, message: "ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง" };
            }
        } catch (error) {
            // เกิดข้อผิดพลาดในการเข้าถึงฐานข้อมูล
            return { success: false, message: "มีข้อผิดพลาดในการเข้าถึงข้อมูล" };
        }
    }

}