import 'package:flutter/material.dart';
import 'package:news_app/views/screens/detail_screen.dart';
import 'package:news_app/views/widgets/custombutton.dart';
import 'package:news_app/views/widgets/customtextfield.dart';
import 'package:news_app/views/widgets/customtextfieldfavorite.dart';
import 'package:news_app/views/widgets/dialogbox.dart';
import 'package:news_app/views/widgets/recommendeditems.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../../controllers/favorite_controller.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final favoritecontroller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Favorite',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
                onTap: (() => showDialog(
                    context: context,
                    builder: ((context) => DialogBox(function: () {
                          favoritecontroller.removeAll();
                        })))),
                child: CustomButton(icon: Icon(Icons.delete_outline))),
          ],
        ),
        SizedBox(
          height: 25,
        ),
        CustomTextFieldFavorite(
          getcontroller: favoritecontroller,
          icon: Icon(Icons.favorite),
        ),
        SizedBox(
          height: 25,
        ),
        Obx(() {
          if (favoritecontroller.favoriteData.value.isEmpty) {
            return Expanded(
              child: Lottie.network(
                  'https://assets2.lottiefiles.com/packages/lf20_6FI8sRTSYl.json'),
            );
          } else {
            return Expanded(
                child: ListView.builder(
                    itemCount: favoritecontroller.favoriteData.value.length,
                    itemBuilder: ((context, index) => GestureDetector(
                          onDoubleTap: (() => favoritecontroller.removeThis(
                              favoritecontroller
                                  .favoriteData.value[index].urltoimage)),
                          onTap: () => Get.to(() => DetailScreen(
                                favoriteItem: favoritecontroller
                                    .favoriteData.value[index],
                                category: 'Favorite',
                                name: favoritecontroller
                                    .favoriteData.value[index].name,
                                imageUrl: favoritecontroller
                                    .favoriteData.value[index].urltoimage,
                                title: favoritecontroller
                                    .favoriteData.value[index].title,
                                content: favoritecontroller
                                    .favoriteData.value[index].content,
                                publishedat: favoritecontroller
                                    .favoriteData.value[index].publishedat,
                                url: favoritecontroller
                                    .favoriteData.value[index].url,
                              )),
                          child: RecommendedItems(
                            author: favoritecontroller
                                .favoriteData.value[index].author,
                            imageUrl: favoritecontroller
                                .favoriteData.value[index].urltoimage,
                            title: favoritecontroller
                                .favoriteData.value[index].title,
                          ),
                        ))));
          }
        })
      ]),
    );
  }
}
