import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:quotes_app/Screen/HomePage/Controller/QuotesController.dart';
import 'package:quotes_app/utils/DB/DB_Helper.dart';
import 'package:sizer/sizer.dart';
import 'package:focused_menu/focused_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    homeController.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: (Text(
            "Amazing Quotes",
            style: GoogleFonts.lobster(fontSize: 30, color: Colors.white),
          )),
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed('Home');
              },
              child: Padding(
                padding: EdgeInsets.only(right: 15),
                child: Icon(Icons.add_box_outlined),
              ),
            ),
          ],
        ),
        // backgroundColor: Colors.grey.shade300,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 30.h,
                child: CarouselSlider.builder(
                  itemCount: homeController.imageList.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "${homeController.imageList[index]}",
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  options: CarouselOptions(
                    aspectRatio: 2,
                    animateToClosest: true,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    homeController.QuoteData = homeController.popu[0];
                    // homeController.Data = homeController.popu[0];
                    Get.toNamed('cete');
                  },
                  child: Container(
                    height: 40.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  homeController.QuoteData =
                                      homeController.popu[0];
                                  Get.toNamed('cete');
                                },
                                child: Container(
                                  height: 15.h,
                                  width: 40.w,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${homeController.popu[0].category}",
                                    style: GoogleFonts.lobster(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: RadialGradient(
                                      colors: [
                                        Colors.red.shade200,
                                        Colors.red.shade300,
                                        Colors.red,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              InkWell(
                                onTap: () {
                                  homeController.QuoteData =
                                      homeController.popu[1];
                                  Get.toNamed('cete');
                                },
                                child: Container(
                                  height: 15.h,
                                  width: 40.w,
                                  child: Center(
                                      child: Text(
                                    "${homeController.popu[1].category}",
                                    style: GoogleFonts.lobster(
                                        fontSize: 20, color: Colors.white),
                                  )),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: RadialGradient(
                                      colors: [
                                        Colors.red.shade200,
                                        Colors.red.shade300,
                                        Colors.red,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      homeController.QuoteData =
                                          homeController.popu[2];
                                      Get.toNamed('cete');
                                    },
                                    child: Container(
                                      height: 15.h,
                                      width: 40.w,
                                      child: Center(
                                          child: Text(
                                        "${homeController.popu[2].category}",
                                        style: GoogleFonts.lobster(
                                            fontSize: 20, color: Colors.white),
                                      )),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: RadialGradient(
                                          colors: [
                                            Colors.red.shade200,
                                            Colors.red.shade300,
                                            Colors.red,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      homeController.QuoteData =
                                          homeController.popu[3];
                                      Get.toNamed('cete');
                                    },
                                    child: Container(
                                      height: 15.h,
                                      width: 40.w,
                                      child: Center(
                                          child: Text(
                                        "${homeController.popu[3].category}",
                                        style: GoogleFonts.lobster(
                                            fontSize: 20, color: Colors.white),
                                      )),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: RadialGradient(
                                          colors: [
                                            Colors.red.shade200,
                                            Colors.red.shade300,
                                            Colors.red,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Obx(
                  () => homeController.DataList.isNotEmpty
                      ? SizedBox(
                    height: 20.h,
                    width: 100.w,
                    child: Obx(
                          () => GridView.builder(
                        itemCount: homeController.DataList.length,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10.w,
                            mainAxisSpacing: 10.w,
                            crossAxisCount: 1,
                            mainAxisExtent: 60.w),
                        itemBuilder: (context, index) {
                          return FocusedMenuHolder(
                            menuItems: [
                              FocusedMenuItem(
                                title: Text("Delete"),
                                onPressed: () {
                                  DBHelper.dbHelper.Deletdata(
                                      homeController.DataList[index]['id']);
                                  homeController.getData();
                                },
                                //     trailingIcon: Icon(Icons.delete)),
                                // FocusedMenuItem(
                                //     title: Text("Update"),
                                //     onPressed: () {},
                                //     trailingIcon: Icon(Icons.edit),
                              ),
                            ],
                            onPressed: () {},
                            child: InkWell(
                              onTap: () {
                                homeController.quote =
                                homeController.DataList[index];
                                Get.toNamed('add');
                              },
                              child: Container(
                                // color: homeController.DataList[index]['color'],
                                child: Center(
                                  child: Text(
                                    "${homeController.DataList[index]['category']}",
                                    style: GoogleFonts.lobster(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: RadialGradient(
                                    colors: [
                                      Colors.red.shade200,
                                      Colors.red.shade300,
                                      Colors.red,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                      : Center(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('Home');
                      },
                      child: Text(
                        "Pleas Add Your Category",
                        style: GoogleFonts.lobster(
                            fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     height: 40.h,
              //     width: 100.w,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       // color: Colors.white,
              //     ),
              //     child: Column(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(15),
              //           child: Row(
              //             children: [
              //               Container(
              //                 height: 15.h,
              //                 width: 40.w,
              //                 child: Center(child: Text("Love")),
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(20),
              //                   gradient: RadialGradient(
              //                     colors: [
              //                       Colors.red.shade200,
              //                       Colors.red.shade300,
              //                       Colors.red,
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //               SizedBox(
              //                 width: 6.w,
              //               ),
              //               Container(
              //                 height: 15.h,
              //                 width: 40.w,
              //                 child: Center(child: Text("Love")),
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(20),
              //                   gradient: RadialGradient(
              //                     colors: [
              //                       Colors.red.shade200,
              //                       Colors.red.shade300,
              //                       Colors.red,
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         SizedBox(
              //           height: 0,
              //         ),
              //         Column(
              //           children: [
              //             Padding(
              //               padding: const EdgeInsets.all(15),
              //               child: Row(
              //                 children: [
              //                   Container(
              //                     height: 15.h,
              //                     width: 40.w,
              //                     child: Center(child: Text("Love")),
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(20),
              //                       gradient: RadialGradient(
              //                         colors: [
              //                           Colors.red.shade200,
              //                           Colors.red.shade300,
              //                           Colors.red,
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     width: 6.w,
              //                   ),
              //                   Container(
              //                     height: 15.h,
              //                     width: 40.w,
              //                     child: Center(child: Text("Love")),
              //                     decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(20),
              //                       gradient: RadialGradient(
              //                         colors: [
              //                           Colors.red.shade200,
              //                           Colors.red.shade300,
              //                           Colors.red,
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
