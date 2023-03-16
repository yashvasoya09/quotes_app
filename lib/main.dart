import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:quotes_app/CategoryAdd_Screen/view/Add_quotes.dart';
import 'package:quotes_app/Screen/HomePage/View/HomePage.dart';
import 'package:quotes_app/Screen/Second_Page/View/SecondPage.dart';
import 'package:sizer/sizer.dart';
import 'CategoryAdd_Screen/view/Add_Category.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => HomePage(),
            'Home': (context) => SecondPage(),
            'add': (context) => addPage(),
            'cete': (context) => Category(),
          },
        );
      },
    ),
  );
}
