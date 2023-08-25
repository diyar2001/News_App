import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class RecommendSection extends StatelessWidget {
  const RecommendSection({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Padding(
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
                  child: const Text(
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
    );
  }
}
