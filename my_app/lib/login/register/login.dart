import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/app_config.dart';
import 'package:my_app/login/register/register.dart';
// import 'package:my_app/mainbody/home.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final _formKey = GlobalKey();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> login(String email, String password) async {
  final url = Uri.parse('${AppConfig.SERVICE_URL}/api/login'); // เปลี่ยน YOUR_SERVER_URL ให้เป็น URL ของเซิร์ฟเวอร์ Express.js ของคุณ
  final response = await http.post(
    url,
    body: {
      'email': email,
      'password': password,
    },
  );

  if (response.statusCode == 200) {
    Navigator.pushNamed(context, 'home');
    // ลงชื่อเข้าใช้สำเร็จ
    // คุณสามารถนำ Token ที่ได้มาใช้งานได้ตามที่คุณต้องการ
  } else {
    Navigator.pushNamed(context, 'login');
    // ลงชื่อเข้าใช้ไม่สำเร็จ
    // คุณสามารถแสดงข้อความแจ้งเตือนหรือทำอะไรตามที่คุณต้องการ
  }
}

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                children: <Widget>[
                  Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Login with your user and password',
                    style: TextStyle(fontSize: 18, color: Color(0xFFA29F9F)),
                  ),
                  Text(
                    'To continue using this app.',
                    style: TextStyle(fontSize: 18, color: Color(0xFFA29F9F)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Username';
                        }

                        return null;
                      },
                      controller: _emailController,
                      style: TextStyle(fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Enter your username",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(Icons.perm_identity_rounded),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Color(0xFFA29F9F)),
                          gapPadding: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }

                        return null;
                      },
                      controller: _passwordController,
                      style: TextStyle(fontStyle: FontStyle.italic),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: Icon(Icons.https_outlined),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 42,
                          vertical: 20,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(28),
                          borderSide: BorderSide(color: Color(0xFFA29F9F)),
                          gapPadding: 10,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Checkbox(
                        value: false,
                        onChanged: (value) {},
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          color: Color(0xFFA29F9F),
                        ),
                      ),
                      Spacer(),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 13),
                                ),
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(
                                  //   builder: (context) {
                                  //     return forgotpasswordscreen();
                                  //   },
                                  // ));
                                },
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Color(0xFFA29F9F),
                                  ),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 350,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFD4556),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18))),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        final email = _emailController.text; // รับค่า Email จาก TextFormField
                        final password = _passwordController.text; // รับค่า Password จาก TextFormField
                        login (email, password); 
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return homescreen();
                        //   },
                        // ));
                      },
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     squaretile(imagesPath: 'assets/images/google.png'),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     squaretile(imagesPath: 'assets/images/facebook.png'),
                  //   ],
                  // ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Registerscreen();
                              }));
                            },
                            child: const Text(
                              'Register now',
                              style: TextStyle(
                                  color: Color(0xFFFD4556),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
