import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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

  // @override
  // void initState() {
  //   homeController.getData();
  //   super.initState();
  // }
  // Color currentColor = Colors.red;
  // Color pickColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Add Category"),
          backgroundColor: Colors.red,
        ),
        body: Form(
          key: homeController.errorkey.value,
          child: Padding(
            padding: EdgeInsets.only(
              left: Get.width / 21,
              top: Get.width / 15,
              right: Get.width / 21,
            ),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  TextFormField(
                    controller: homeController.txtAdd1.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.menu_book,
                        size: 21.sp,
                      ),
                      prefixIconColor: Colors.grey,
                      hintText: "Category Name",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Add Category  Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  TextFormField(
                    controller: homeController.txtAdd3.value,
                    maxLines: 4,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.edit,
                        size: 21.sp,
                      ),
                      prefixIconColor: Colors.grey,
                      hintText: "Add Quotes",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Add Quotes ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  TextFormField(
                    controller: homeController.txtAdd2.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        size: 21.sp,
                      ),
                      prefixIconColor: Colors.grey,
                      hintText: "Author Name",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(color: Colors.grey, width: 2)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Add About Author  Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: Get.width / 18,
                  ),
                  GetBuilder<HomeController>(
                    builder: (controller) => InkWell(
                        onTap: () {
                          Get.defaultDialog(
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: controller.pickColor,
                                  onColorChanged: (Color color) {
                                    controller.changeColore2(color);
                                    // homeController.pickColor = color;
                                    // setState(() {
                                    //   pickColor = color;
                                    // });
                                  },
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      // setState(() {
                                      //   currentColor = pickColor;
                                      // });
                                      // homeController.currentColor = homeController.pickColor;
                                      controller
                                          .changeColor(controller.pickColor);
                                      Get.back();
                                    },
                                    child: Text("Get Color"))
                              ]);
                        },
                        child: Container(
                          height: Get.height / 15,
                          width: Get.width / 1.3,
                          decoration: BoxDecoration(
                              color: controller.currentColor,
                              borderRadius: BorderRadius.circular(15)),
                          alignment: Alignment.center,
                          child: Text(
                            "Pick Color",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                        )),
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
                          color: Colors.deepOrangeAccent.shade100,
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Text(
                        "Add Book",
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
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
