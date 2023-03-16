import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/Screen/HomePage/Controller/QuotesController.dart';
import 'package:sizer/sizer.dart';

class addPage extends StatefulWidget {
  const addPage({Key? key}) : super(key: key);

  @override
  State<addPage> createState() => _addPageState();
}

class _addPageState extends State<addPage> {
  HomeController homeController = Get.put(HomeController());

  // @override
  // void initState() {
  //   homeController.getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(""),
      // ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset("assets/image/zoo1.jpg", fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w,top: 15.h),
            height: 50.h,
            width: 60.w,
            alignment: Alignment.center,
            child: Text(
              "${homeController.quote['quote']}",
              style: GoogleFonts.lobster(fontSize: 20, color: Colors.black),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 5.h,left: 50.w),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "-${homeController.quote['color']}",
                style: GoogleFonts.lobster(fontSize: 20, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
