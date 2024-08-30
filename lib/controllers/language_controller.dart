import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  int selectedLanguageIndex = 1;
  String savedLocale = 'en';
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    _loadLocale();
    setSelectedLanguageIndex();
  }

  void _saveLocale() {
    storage.write('locale', savedLocale);
  }

  void _loadLocale() {
    savedLocale = storage.read<String>('locale') ?? 'en';
    Get.updateLocale(Locale(savedLocale));
    update();
  }

  void setSelectedLanguageIndex() async {
    switch (savedLocale) {
      case 'am':
        selectedLanguageIndex = 1;
        break;
      case 'en':
        selectedLanguageIndex = 2;
        break;
      default:
        selectedLanguageIndex = 1;
        break;
    }
    update();
  }

  void changeLanguage(String value) {
    savedLocale = value;
    update();
    Get.updateLocale(Locale(value));
    _saveLocale();
    setSelectedLanguageIndex();
  }
}
