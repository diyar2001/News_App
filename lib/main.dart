import 'package:flutter/material.dart';
import 'package:news_app/controllers/themecontroller.dart';
import 'package:news_app/routes.dart';
import 'package:news_app/utils/api_auth.dart';
import 'package:news_app/views/screens/detail_screen.dart';
import 'package:news_app/views/screens/homepage.dart';
import 'package:get/get.dart';
import 'package:news_app/views/screens/splash_screen.dart';
import 'sqlhelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqlHelper().initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());

    return Obx(() {
      return GetMaterialApp( 
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: themeController.currentTheme, 
        initialRoute: '/SplashScreen',
        getPages: RouteHelper.routes,
      );
    });
  }
}
