import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/Screen/HomePage/Controller/QuotesController.dart';
import 'package:get/get.dart';
import 'package:quotes_app/utils/DB/DB_Helper.dart';
import 'package:sizer/sizer.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add Category",style: GoogleFonts.play()),
          backgroundColor: Colors.black,
        ),
        body: Form(
          key: homeController.errorkey.value,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(6)),
                    child: TextFormField(style: GoogleFonts.play(color:Colors.black),
                      cursorColor: Colors.black,
                      controller: homeController.txtAdd1.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.menu_book,
                          color: Colors.black,
                        ),
                        prefixIconColor: Colors.grey,
                        hintText: "Category Name",
                        hintStyle: GoogleFonts.play(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.black, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.black, width: 2)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Add Category  Name";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    color: Colors.white70,),
                    child: TextFormField(
                      controller: homeController.txtAdd3.value,
                      maxLines: 4,
                      cursorColor: Colors.black,
                      style: GoogleFonts.play(),
                      decoration: InputDecoration(

                        prefixIcon: Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 21.sp,
                        ),
                        prefixIconColor: Colors.black,
                        hintText: "Add Quotes",
                        hintStyle: GoogleFonts.play(color: Colors.black),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.black, width: 2)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Add Quotes ";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.white70,borderRadius: BorderRadius.circular(6)),
                    child: TextFormField(
                      style: GoogleFonts.play(color: Colors.black),
                      cursorColor: Colors.black,
                      controller: homeController.txtAdd2.value,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          size: 21.sp,
                        ),
                        prefixIconColor: Colors.black,
                        hintText: "Author Name",
                        hintStyle: GoogleFonts.play(color: Colors.black),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(color: Colors.black, width: 2)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Add About Author  Name";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  InkWell(
                    onTap: () {
                      if (homeController.errorkey.value.currentState!
                          .validate()) {
                        DBHelper.dbHelper.insertData(
                          category: homeController.txtAdd1.value.text,
                          quote: homeController.txtAdd3.value.text,
                          color: homeController.txtAdd2.value.text,
                        );
                        homeController.getData();

                        Get.back();
                      }
                    },
                    child: Container(
                      height: Get.height / 15,
                      width: Get.width / 1.3,
                      decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Text(
                        "Add Book",
                        style: GoogleFonts.play(color: Colors.black, fontSize: 18.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
