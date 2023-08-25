import 'package:flutter/material.dart';
import 'package:news_app/views/detail/screens/detail_screen.dart';
import 'package:news_app/views/widgets/custombutton.dart';
import 'package:news_app/views/discover/widgets/customtextfield.dart';
import 'package:news_app/views/favorite/widgets/customtextfieldfavorite.dart';
import 'package:news_app/views/favorite/widgets/dialogbox.dart';
import 'package:news_app/views/widgets/recommendeditems.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../../../controllers/favorite_controller.dart';
import '../widgets/list_favorite.dart';


class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritecontroller = Get.put(FavoriteController());

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Favorite',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
                onTap: (() => showDialog(
                    context: context,
                    builder: ((context) => DialogBox(function: () {
                          favoritecontroller.removeAll();
                        })))),
                child: CustomButton(icon: const Icon(Icons.delete_outline))),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        CustomTextFieldFavorite(
          getcontroller: favoritecontroller,
          icon: const Icon(Icons.favorite),
        ),
        const SizedBox(
          height: 25,
        ),
        const ListItems()

        ///list of favorite items or lottie image if empty
      ]),
    );
  }
}
