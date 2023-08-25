import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Light Theme Data
ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: Colors.lightBlueAccent,
    iconTheme: IconThemeData(color: Colors.black),
    inputDecorationTheme:
        InputDecorationTheme(hintStyle: TextStyle(color: Colors.black)));

// Dark Theme Data
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color.fromARGB(255, 163, 162, 159),
  accentColor: Colors.amberAccent,
  iconTheme: IconThemeData(color: Colors.grey),
  inputDecorationTheme:
      InputDecorationTheme(hintStyle: TextStyle(color: Colors.black)),
);

class ThemeController extends GetxController {
  final Rx<ThemeData> _currentTheme = lightTheme.obs;
  late SharedPreferences prefs;

  get currentTheme => _currentTheme.value;

  
  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    getCurrentTheme();
  }

//get curretnTheme state
  void getCurrentTheme() {
    bool isLight = prefs.getBool('isLight') ?? true;
    _currentTheme.value = isLight ? lightTheme : darkTheme;
  }

//set currentTheme state into sharedprefs
  void setCurrentTheme() async {
    await prefs.setBool('isLight', _currentTheme.value == lightTheme);
  }

//switch between dark and light theme
  void changeTheme() {
    if (_currentTheme.value == lightTheme) {
      _currentTheme.value = darkTheme;
    } else {
      _currentTheme.value = lightTheme;
    }
    setCurrentTheme();
  }
}
