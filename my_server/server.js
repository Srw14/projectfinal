const express = require('express');
const mysql = require('mysql');
const jwt = require('jsonwebtoken');
const User = require('./libs/User');
const Product = require("./libs/Product");
const app = express();
const PORT = 3000;
const SECRET_KEY = 'MySecretKey';

app.use(express.json());

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'agm',
    connectionLimit: 10
});

app.post('/api/register', (req, res) => {
    const { name, email, password } = req.body;

    if (!name || !email || !password) {
        return res.status(400).json({ message: 'กรุณากรอกข้อมูลให้ครบถ้วน' });
    }

    const checkEmailQuery = "SELECT * FROM user WHERE email = ?";
    pool.query(checkEmailQuery, [email], (err, results) => {
        if (err) {
            return res.status(500).json({ message: 'มีข้อผิดพลาดในระบบ' });
        }

        if (results.length > 0) {
            return res.status(400).json({ message: 'อีเมลนี้มีการใช้งานอยู่แล้ว' });
        }

        const insertUserQuery = "INSERT INTO user (name, email, password) VALUES (?, ?, ?)";
        pool.query(insertUserQuery, [name, email, password], (err, results) => {
            if (err) {
                return res.status(500).json({ message: 'มีข้อผิดพลาดในระบบ' });
            }

            res.status(201).json({ message: 'การลงทะเบียนสำเร็จ' });
        });
    });
});

app.post('/api/login', (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ message: 'กรุณากรอกอีเมลและรหัสผ่าน' });
    }

    const checkUserQuery = "SELECT * FROM user WHERE email = ? AND password = ?";

    pool.query(checkUserQuery, [email, password], (err, results) => {
        if (err) {
            return res.status(500).json({ message: 'มีข้อผิดพลาดในระบบ' });
        }

        if (results.length === 0) {
            return res.status(401).json({ message: 'อีเมลหรือรหัสผ่านไม่ถูกต้อง' });
        }

        // ตรวจสอบผู้ใช้ผ่าน สร้าง Token
        const user = results[0];
        const token = jwt.sign({ email: user.email }, SECRET_KEY);

        res.status(200).json({ message: 'เข้าสู่ระบบสำเร็จ', token });
    });
});

//เพิ่มข้อมูล
// app.post("/api/product/add", checkAuth, async(req,res) =>{
//     const input = req.body;

//     try{
//         var result = await Product.createProduct(pool,
//             input.product_id, input.product_name,
//             input.type,input.price,input.details,);

//         res.json({
//             result: true
//         });
//     } catch (ex){
//         res.json({
//             result:false,
//             message: ex.message
//         });
//     }
// });

// //เพิ่มข้อมูลสินค้า
app.get("api/product_types", (req, res) => {
    const query = "SELECT * FROM product_types";

    pool.query(query, (error, results) => {
        if(error) {
            res.json({
                result: false,
                message: error.message
            })
        }else{
            res.json({
                result: true,
                data: results
            });
        }
    });
});


app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});