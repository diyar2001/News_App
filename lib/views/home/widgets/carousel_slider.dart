import 'package:flutter/material.dart';

import 'breakingshimmer.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'newsitems.dart';
import '../../../controllers/home_controller.dart';

class MyCarouselSlider extends StatefulWidget {
  MyCarouselSlider({super.key});

  @override
  _MyCarouselSliderState createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Obx(() {
      if (homeController.breakingList.isEmpty) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: BreakingShimmer(),
        );
      } else {
        return Expanded(
            child: CarouselSlider.builder(
          itemCount: homeController.breakingList.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  GestureDetector(
            onTap: () => Get.toNamed('/DetailScreen',
                arguments: homeController.breakingList[itemIndex]),
            child: NewsItem(
              newsApiModel: homeController.breakingList[itemIndex],
            ),
          ),
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height / 4,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: ((index, reason) {
              homeController.setActiveIndex(index);
            }),
            scrollDirection: Axis.horizontal,
          ),
        ));
      }
    });
  }
}
