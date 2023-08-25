import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/discover_controller.dart';
import '../../widgets/recommendeditems.dart';
import '../../widgets/recommendedshimmer.dart';

class ListItems extends StatelessWidget {
  const ListItems({super.key});

  @override
  Widget build(BuildContext context) {
    DiscoverController discoverController = Get.put(DiscoverController());

    return Obx(() {
      if (discoverController.dataList.isEmpty) {
        return Expanded(child: RecommendeShimmer());
      } else {
        return Expanded(
            child: ListView.builder(
                itemCount: discoverController.dataList.length,
                itemBuilder: ((context, index) => GestureDetector(
                      onTap: () => Get.toNamed('DetailScreen',
                          arguments: discoverController.dataList[index]),
                      child: RecommendedItems(
                          newsApiModel: discoverController.dataList[index]),
                    ))));
      }
    });
  }
}
