
import 'package:flutter/material.dart';


class PreferencesManager {
  static late SharedPreferences _prefs;
  static const String _test = 'test';
 

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  static String? getTest() => _prefs.getString(_test);


  static Future<String> setTest(value) => _prefs.setString(_setTest, value);
}
