import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/favorite_controller.dart';
import '../../../data/models/newsapi_model.dart';
import 'appbar.dart';
import '../../widgets/glassbutton.dart';
import 'package:share_plus/share_plus.dart';

class TopSpaceBarBox extends StatelessWidget {
  final NewsApiModel newsApiModel;

  const TopSpaceBarBox(
      {super.key, required this.newsApiModel,});

  @override
  Widget build(BuildContext context) {
    final favoritecontroller = Get.put(FavoriteController());
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.network(newsApiModel.urltoimage).image, fit: BoxFit.cover),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.4, // Adjust the opacity  as desired
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black
                    ])),
          ),
          Column(
            children: [
              Appbar(
                  button1: GestureDetector(
                    onTap: () => Get.back(),
                    child: GlassButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  button2: GestureDetector(
                    onTap: () => favoritecontroller.addFavorite(newsApiModel),
                    child: GlassButton(
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  button3: GestureDetector(
                    onTap: (() =>
                        Share.share(newsApiModel.url, subject: 'Share this content')),
                    child: GlassButton(
                        icon: Icon(
                      Icons.share,
                      color: Theme.of(context).primaryColor,
                    )),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text(
                      'More ..',
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Theme.of(context).accentColor),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      newsApiModel.title.toString(),
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '. ${newsApiModel.publishedat.toString()}',
                      style: TextStyle(
                          fontSize: 13, color: Theme.of(context).primaryColor),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
