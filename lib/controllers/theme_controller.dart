import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkTheme = false.obs;
  
  ThemeData get theme =>
      isDarkTheme.value ? ThemeData.dark() : ThemeData.light();
  
  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
  }
}
