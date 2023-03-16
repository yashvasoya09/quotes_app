import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotes_app/Screen/HomePage/Model/NoteModel.dart';
import 'package:quotes_app/utils/DB/DB_Helper.dart';

class HomeController extends GetxController {
  RxList DataList = [].obs;
  RxList<Map> SearchDataList = <Map>[].obs;
  RxInt photo = 0.obs;
  NoteModel QuoteData = NoteModel();
  NoteModel Data = NoteModel();
  Map quote = Map();
  RxList<NoteModel> popu = <NoteModel>[
    NoteModel(
        quote: "The way to get started is to quit talking and begin doing.",
        category: "Motivetion",
        image: [
          "assets/image/best.jpg",
          "assets/image/reto.jpg",
          "assets/image/image1.jpg",
          "assets/image/cout1.png"
        ]),
    NoteModel(
        quote: "As he read, I fell in love the way you fall asleep: slowly, and then all at once.",
        category: "Love",
        image: [
          "assets/image/best.jpg",
          "assets/image/reto.jpg",
          "assets/image/image1.jpg",
          "assets/image/cout1.png",
        ]),
    NoteModel(
        quote: "Education is the most powerful weapon which you can use to change the world.",
        category: "Education",
        image: [
          "assets/image/best.jpg",
          "assets/image/reto.jpg",
          "assets/image/image1.jpg",
          "assets/image/cout1.png"
        ]),
    NoteModel(
        quote: "Success is not final; failure is not fatal: it is the courage to continue that counts.",
        category: "Business",
        image: [
          "assets/image/best.jpg",
          "assets/image/reto.jpg",
          "assets/image/image1.jpg",
          "assets/image/cout1.png",
        ]),
  ].obs;

  Rx<TextEditingController> txtcategory = TextEditingController().obs;
  Rx<TextEditingController> txtAdd1 = TextEditingController().obs;
  Rx<TextEditingController> txtAdd2 = TextEditingController().obs;
  Rx<TextEditingController> txtAdd3 = TextEditingController().obs;
  Rx<GlobalKey<FormState>> errorkey = GlobalKey<FormState>().obs;

  // Rx<Color> currentColor = Colors.red.obs;
  // Rx<Color> pickColor = Colors.red.obs;
  Color currentColor = Colors.red;
  Color pickColor = Colors.red;

  void getData() async {
    DataList.value = await DBHelper.dbHelper.readData();
  }

  RxList<String> imageList = [
    "assets/image/wine1.jpg", //0
    "assets/image/wine2.jpg", //1
    "assets/image/wine3.jpg", //2
    "assets/image/wine4.jpeg", //3
    "assets/image/wine5.jpg", //4
    "assets/image/wine6.jpg", //5
    "assets/image/wine10.webp", //6
  ].obs;

  void changeColor(Color color) {
    currentColor = color;
    update();
  }

  void changeColore2(Color color) {
    pickColor = color;
    update();
  }
}
