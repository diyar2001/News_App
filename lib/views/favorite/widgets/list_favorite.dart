import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/controllers/favorite_controller.dart';

import '../../widgets/recommendeditems.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritecontroller = Get.put(FavoriteController());
    return Obx(() {
      if (favoritecontroller.favoriteData.isEmpty) {
        return Expanded(
          child: Lottie.network(
              'https://assets2.lottiefiles.com/packages/lf20_6FI8sRTSYl.json'),
        );
      } else {
        return Expanded(
            child: ListView.builder(
                itemCount: favoritecontroller.favoriteData.length,
                itemBuilder: ((context, index) => GestureDetector(
                      onDoubleTap: (() => favoritecontroller.removeThis(
                          favoritecontroller.favoriteData[index].urltoimage)),
                      onTap: () => Get.toNamed('DetailScreen',
                          arguments: favoritecontroller.favoriteData[index]),
                      child: RecommendedItems(
                        newsApiModel: favoritecontroller.favoriteData[index],
                      ),
                    ))));
      }
    });
  }
}
