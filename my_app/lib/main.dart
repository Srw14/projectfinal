import 'package:flutter/material.dart';
import 'package:my_app/login/register/login.dart';
import 'package:my_app/login/register/register.dart';
import 'package:my_app/mainbody/home.dart';

void main() {
  runApp(const MyApp());
}
  
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        ),
        // routes: {
        //   "productpage": (context) => productpage(),
        // },
      home:loginscreen(),
      routes: {
        'register': (context) => Registerscreen(),
        'home':(context) => homescreen(),
        'login':(context) => loginscreen(),
      },
    );
  }
}