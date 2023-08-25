import 'package:flutter/material.dart';
import 'package:news_app/controllers/themecontroller.dart';
import 'package:news_app/views/screens/detail_screen.dart';
import 'package:news_app/views/widgets/appbar.dart';
import 'package:news_app/views/widgets/custombutton.dart';
import 'package:news_app/views/widgets/newsitems.dart';
import '../widgets/recommendeditems.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../controllers/home_controller.dart';
import 'package:get/get.dart';
import '../widgets/breakingshimmer.dart';
import '../widgets/recommendedshimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int activeIndex = 0;

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
            children: [
              Shimmer.fromColors(
                baseColor: Theme.of(context).accentColor,
                highlightColor: const Color.fromARGB(255, 192, 202, 207),
                period: const Duration(seconds: 10),
                child: Text(
                  'News App',
                  style: TextStyle(
                      fontFamily: 'cursive',
                      fontSize: 35,
                      wordSpacing: 2,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor),
                ),
              ),
              Obx(() {
                return GestureDetector(
                    onTap: (() => themeController.changeTheme()),
                    child: CustomButton(
                        icon: themeController.currentTheme == lightTheme
                            ? const Icon(Icons.light_mode)
                            : const Icon(Icons.dark_mode)));
              }),
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
        Obx(() {
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
                  setState(() {
                    activeIndex = index;
                  });
                }),
                scrollDirection: Axis.horizontal,
              ),
            ));
          }
        }),
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: homeController.breakingList.length,
          effect: ExpandingDotsEffect(
              dotHeight: 10, activeDotColor: Theme.of(context).accentColor),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recommendation',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Obx(() {
                switch (homeController.viewAllState) {
                  case ViewAllState.viewAll:
                    return GestureDetector(
                      onTap: (() => homeController.viewAll()),
                      child: Text(
                        'View All',
                        style: TextStyle(color: Colors.blue),
                      ),
                    );
                  case ViewAllState.wait:
                    return Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 50,
                        width: MediaQuery.of(context).size.height / 50,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    );
                  case ViewAllState.remove:
                    return const Text('');
                }
              }),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 100,
        ),
        Obx(() {
          if (homeController.recommendedList.isEmpty) {
            return Expanded(child: RecommendeShimmer());
          } else {
            return Expanded(
                child: ListView.builder(
                    itemCount: homeController.recommendListLength,
                    itemBuilder: ((context, index) => GestureDetector(
                          onTap: () => Get.toNamed('DetailScreen',
                              arguments: homeController.recommendedList[index]),
                          child: RecommendedItems(
                            newsApiModel: homeController.recommendedList[index],
                          ),
                        ))));
          }
        })
      ],
    );
  }
}
