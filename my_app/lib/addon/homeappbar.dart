import 'package:flutter/material.dart';

class homeappbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFBF5),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(Icons.sort,
          size: 30,
          color: Color(0xFFFD4556),
          ),
          Padding(
            padding: EdgeInsets.only(left: 200,),
            child: Text("AG Market",
            style: TextStyle(fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFD4556),
                ),
              ),
            ),
            Spacer(),
        ],
      ),
    );  
  }
}