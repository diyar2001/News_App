import 'package:flutter/material.dart';
import 'package:news_app/controllers/themecontroller.dart';
import 'package:news_app/views/detail/screens/detail_screen.dart';
import 'package:news_app/views/detail/widgets/appbar.dart';
import 'package:news_app/views/widgets/custombutton.dart';
import 'package:news_app/views/home/widgets/newsitems.dart';
import '../../widgets/recommendeditems.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../controllers/home_controller.dart';
import 'package:get/get.dart';
import '../widgets/breakingshimmer.dart';
import '../../widgets/recommendedshimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shimmer/shimmer.dart';

import '../widgets/carousel_slider.dart';
import '../widgets/dot_indicator.dart';
import '../widgets/logo.dart';
import '../widgets/recommendation_section.dart';
import '../widgets/recommended_list.dart';
import '../widgets/theme_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final ThemeController themeController = Get.put(ThemeController());

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ShimmerLogo(),
              ThemeButton()
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Breking News',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        MyCarouselSlider(),
        const DotIndicator(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        const RecommendSection(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
       const RecommendedListView(),

      ],
    );
  }
}
