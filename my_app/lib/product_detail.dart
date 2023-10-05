// import 'dart:html';
// import 'dart:js_interop_unsafe';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_app/product_type.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as = http;
// import 'package:my_app/app_config.dart';
// import 'package:my_app/product_type.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.productId}) : super(key: key);

  final int productId;

  @override
  ProductDetailState createState(){
    return ProductDetailState();
  }
}

class ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context){
    throw UnimplementedError();
  }
}

List<ProductType> ProductTypes = [];
int productTypeId = 1;

// ตัวแกรสำหรับใช้ใน form
final _formKey = GlobalKey<FormState>();
final _product_idController = TextEditingController();
final _product_nameController = TextEditingController();
final _typeController = TextEditingController();
final _priceController = TextEditingController();
final _detailsController = TextEditingController();

// @override
// void initState(){
//   fetchProductType();
//   super.initState();

// void fetchProductType() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();

//   final Response = await http.get(
//     Uri.parse("${AppConfig.SERVICE_URL}/api/product_types"),
//     'Content-Type': 'application/json; charset=UTF-8',

//   )
// }
