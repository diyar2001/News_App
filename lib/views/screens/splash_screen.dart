import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/views/screens/homepage.dart';
import 'package:lottie/lottie.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500
    ));
    Future.delayed(Duration(seconds: 10), (() => Get.to(HomePage())));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Color.fromARGB(255, 255, 247, 225),
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: LottieBuilder.asset(
                'assets/images/spashscreen.json', 
                addRepaintBoundary: true,
                repeat: false,
                controller: _controller,
                onLoaded: (composition) {
                  // Configure the AnimationController with the duration of the
                  // Lottie file and start the animation.
                  _controller.forward();
                },
              ),
            ),
            Expanded(child: LoadingAnimationWidget.hexagonDots(color: Colors.blueAccent,size: 50))
          ],
        ),
      ),
    ));
  }
}
