import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Obx(() {
      return AnimatedSmoothIndicator(
        activeIndex: homeController.activeIndex,
        count: homeController.breakingList.length,
        effect: ExpandingDotsEffect(
            dotHeight: 10, activeDotColor: Theme.of(context).accentColor),
      );
    });
  }
}
