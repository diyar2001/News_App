import 'package:flutter/material.dart';
import 'package:news_app/controllers/themecontroller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/views/screens/homepage.dart';
import 'package:get/get.dart';
import 'package:news_app/views/screens/splash_screen.dart';
import 'sqlhelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlHelper().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final themeController = Get.put(ThemeController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp( 
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: themeController.currentTheme.value,
        home:const SplashScreen(),
      );
    });
  }
}
