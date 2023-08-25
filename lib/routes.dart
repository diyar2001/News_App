import 'package:get/get.dart';
import 'package:news_app/views/detail/screens/detail_screen.dart';
import 'package:news_app/mainpage.dart';
import 'package:news_app/views/splash/screens/splash_screen.dart';
import 'package:news_app/views/webview/screens/webview_screen.dart';

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
