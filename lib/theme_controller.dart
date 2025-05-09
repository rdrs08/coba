import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final box = GetStorage();

  // reactive var untuk GetX
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Baca dari storage
    isDarkMode.value = box.read('isDarkMode') ?? false;
    // Apply theme awal
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    box.write('isDarkMode', isDarkMode.value);
  }
}
