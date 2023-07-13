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

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final HomeController homeController = Get.put(HomeController());

  final themeController = Get.put(ThemeController());

  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'News App',
                style: TextStyle(
                  fontFamily: 'cursive',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor
                ),
              ),
              Obx(() {
                return GestureDetector(
                    onTap: (() => themeController.changeTheme()),
                    child: CustomButton(
                        icon: themeController.currentTheme.value == lightTheme
                            ? Icon(Icons.light_mode)
                            : Icon(Icons.dark_mode)));
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
        const SizedBox(
          height: 15,
        ),
        Obx(() {
          if (homeController.breakingList.value.isEmpty) {
            return BreakingShimmer();
          } else {
            return Expanded(
                child: CarouselSlider.builder(
              itemCount: homeController.breakingList.value.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      GestureDetector(
                onTap: () => Get.to(() => DetailScreen(
                      favoriteItem:
                          homeController.breakingList.value[itemIndex],
                      category: 'General',
                      name: homeController.breakingList.value[itemIndex].name,
                      imageUrl: homeController
                          .breakingList.value[itemIndex].urltoimage,
                      title: homeController.breakingList.value[itemIndex].title,
                      content:
                          homeController.breakingList.value[itemIndex].content,
                      publishedat: homeController
                          .breakingList.value[itemIndex].publishedat,
                      url: homeController.breakingList.value[itemIndex].url,
                    )),
                child: NewsItem(
                  title: homeController.breakingList.value[itemIndex].title,
                  publishedat:
                      homeController.breakingList.value[itemIndex].publishedat,
                  imageUrl:
                      homeController.breakingList.value[itemIndex].urltoimage,
                  name: homeController.breakingList.value[itemIndex].name,
                ),
              ),
              options: CarouselOptions(
                height: 400,
                aspectRatio: 18 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: null,
                scrollDirection: Axis.horizontal,
              ),
            ));
          }
        }),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommendation',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (() => homeController.viewAll()),
                child: Text(
                  'View all',
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(() {
          if (homeController.recommendedList.value.isEmpty) {
            return Expanded(child: RecommendeShimmer());
          } else {
            return Expanded(
                child: ListView.builder(
                    itemCount: homeController.recommendListLength.value,
                    itemBuilder: ((context, index) => GestureDetector(
                          onTap: () => Get.to(() => DetailScreen(
                                favoriteItem:
                                    homeController.recommendedList.value[index],
                                category: 'General',
                                name: homeController
                                    .recommendedList.value[index].name,
                                imageUrl: homeController
                                    .recommendedList.value[index].urltoimage,
                                title: homeController
                                    .recommendedList.value[index].title,
                                content: homeController
                                    .recommendedList.value[index].content,
                                publishedat: homeController
                                    .recommendedList.value[index].publishedat,
                                url: homeController
                                    .recommendedList.value[index].url,
                              )),
                          child: RecommendedItems(
                            author: homeController
                                .recommendedList.value[index].author,
                            imageUrl: homeController
                                .recommendedList.value[index].urltoimage,
                            title: homeController
                                .recommendedList.value[index].title,
                          ),
                        ))));
          }
        })
      ],
    );
  }
}
