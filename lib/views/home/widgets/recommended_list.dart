import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';
import '../../widgets/recommendeditems.dart';
import '../../widgets/recommendedshimmer.dart';

class RecommendedListView extends StatelessWidget {
  const RecommendedListView({super.key});

  @override
  Widget build(BuildContext context) {
        final homeController = Get.put(HomeController());

    return  Obx(() {
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
        });
  }
}