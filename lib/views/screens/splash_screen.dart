import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration:const Duration(seconds: 2), // Adjust the animation duration
    );

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation completed, navigate to the next screen
        Get.offAllNamed('/');
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your background color
      body: Center(
        child: FadeTransition(
          opacity: _animationController,
          child: AnimatedWidget(), // Replace with your animation widget
        ),
      ),
    );
  }
}

class AnimatedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with your animation widget (e.g., Lottie, GIF, etc.)
    return Lottie.asset('assets/images/animatednews.json');
  }
}
