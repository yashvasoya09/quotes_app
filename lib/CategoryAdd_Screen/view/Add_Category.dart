import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/Screen/HomePage/Controller/QuotesController.dart';
import 'package:sizer/sizer.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text(
          "${homeController.QuoteData.category}",
          style: GoogleFonts.lobster(fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Obx(
            () => Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "${homeController.QuoteData.image![homeController.photo.value]}",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Container(
              height: 60.h,
              width: 50.w,
              child: Padding(
                padding: EdgeInsets.only(top: 35.h, left: 5.w),
                child: Text(
                  "${homeController.QuoteData.quote}",
                  style: GoogleFonts.lobster(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (homeController.photo.value == 3) {
                homeController.photo.value = 0;
              } else {
                homeController.photo.value++;
              }
            },
            child: Padding(
              padding: EdgeInsets.only(top: 80.h, left: 90.w),
              child: Icon(
                Icons.image,
                size: 0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
