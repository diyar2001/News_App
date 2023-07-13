import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Light Theme Data
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  accentColor: Colors.lightBlueAccent,
  iconTheme: IconThemeData(color: Colors.black), // Set the icon color to black
  inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.black) // Set the text color to black
      ),
  // Add more properties for the light theme as needed
);

// Dark Theme Data
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color.fromARGB(255, 163, 162, 159),
  accentColor: Colors.amberAccent,
  iconTheme: IconThemeData(color: Colors.black), // Set the icon color to black
  inputDecorationTheme:
      InputDecorationTheme(hintStyle: TextStyle(color: Colors.black)),
  // Add more properties for the dark theme as needed
);



class ThemeController extends GetxController {
  Rx<ThemeData> currentTheme = lightTheme.obs;
  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    getCurrentTheme();
  }


//get curretnTheme state
  void getCurrentTheme() {
    bool isLight = prefs.getBool('isLight') ?? true;
    currentTheme.value = isLight ? lightTheme : darkTheme;
  }


//set currentTheme state into sharedprefs
  void setCurrentTheme() async {
    await prefs.setBool('isLight', currentTheme.value == lightTheme);
  }


//switch between dark and light theme
  void changeTheme() {
    if (currentTheme.value == lightTheme) {
      currentTheme.value = darkTheme;
    } else {
      currentTheme.value = lightTheme;
    }
    setCurrentTheme();
  }
}
