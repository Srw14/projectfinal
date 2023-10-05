import 'package:flutter/material.dart';
// import 'package:my_app/addon/productslider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class productpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(top: 60.0,left: 10,right: 10),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Icon(Icons.arrow_back_ios),
    //             Row(
    //               children: [
    //                 Icon(Icons.favorite),
    //                 Badge(
                      
    //                 )
    //               ],
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
    return Scaffold(
      backgroundColor: Color(0xFFFFFBF5),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              width : 600,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Stack(
                // children: [
                //   Center(child: productslider(),)
                // ],
              ),
            ),
            SizedBox(height: 10,),
                Container(
                height: 70,
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text("Valorent Diamond Rank", 
                style: TextStyle(fontSize: 22,color: Color.fromARGB(255, 0, 0, 0),fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        RatingBar.builder(  
                          initialRating: 3.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25,
                          itemBuilder: (context,_) => Icon(Icons.star,color: Colors.amber,), 
                          onRatingUpdate: (rating){},),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 300,),
                Container(
                height: 70,
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text("รหัสเปลี่ยนไม่ได้ #ยังไม่ออกID ละ  55 บาทครับ เซิฟนอก-ตัวไม่ครบครบรหัสเปลี่ยนไม่ได้", 
                style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              SizedBox(width: 300,),
              Container(
                height: 70,
                padding: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text("Price : 55 Baht", 
                style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
               SizedBox(
                      width: 350,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFD4556),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                          )
                        ),
                        child: Text("Buy", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                        onPressed: () {
                        },
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}