import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  LanguageProvider() {
    loadSelectedLanguageIndex();
  }

  int LanguageIndex = 0;
  List<String> languagesList = [
    'English',
    'አማርኛ',
  ];

  Future<void> loadSelectedLanguageIndex() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LanguageIndex = prefs.getInt('language') ?? 0;
    notifyListeners();
  }

  Future<void> saveSelectedLanguageIndex(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('language', index);
    LanguageIndex = index;
    notifyListeners();
  }
}
