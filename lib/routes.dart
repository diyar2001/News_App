import 'package:get/get.dart';
import 'package:news_app/views/screens/detail_screen.dart';
import 'package:news_app/views/screens/homepage.dart';
import 'package:news_app/views/screens/splash_screen.dart';
import 'package:news_app/views/screens/webview_screen.dart';

class RouteHelper {

///
///
///list of routes 
  static List<GetPage> routes = [
    GetPage(
        name: '/SplashScreen',
        page: () {
          return SplashScreen();
        },
        transition: Transition.fadeIn,),
    GetPage(
        name: '/DetailScreen',
        page: () {
          return DetailScreen();
        },
        transition: Transition.fadeIn,),
    GetPage(
        name: '/',
        page: () {
          return HomePage();
        },
        transition: Transition.fadeIn,),
    GetPage(
        name: '/Webpage',
        page: () {
          return WebViewScreen();
        },
        transition: Transition.fadeIn,),
  ];
}
