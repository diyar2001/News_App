import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/themecontroller.dart';

import '../../../controllers/home_controller.dart';
import '../../widgets/custombutton.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final themeController = Get.put(ThemeController());

    return Obx(() {
      return GestureDetector(
          onTap: (() => themeController.changeTheme()),
          child: CustomButton(
              icon: themeController.currentTheme == lightTheme
                  ? const Icon(Icons.light_mode)
                  : const Icon(Icons.dark_mode)));
    });
  }
}
