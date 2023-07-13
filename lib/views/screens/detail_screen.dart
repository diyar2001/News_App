import 'package:flutter/material.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/views/screens/home_screen.dart';
import 'package:news_app/views/widgets/appbar.dart';
import 'package:news_app/views/widgets/glassbutton.dart';
import 'package:get/get.dart';
import '../../controllers/favorite_controller.dart';
import 'package:share_plus/share_plus.dart';

class DetailScreen extends StatelessWidget {
  var imageUrl;
  var content;
  var title;
  var publishedat;
  var name;
  var category;
  var favoriteItem;
  var url;
  DetailScreen(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.publishedat,
      required this.content,
      this.name,
      required this.category,
      required this.favoriteItem,
      required this.url});

  final favoritecontroller = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: primerycolor,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.network(imageUrl).image,
                        fit: BoxFit.cover),
                  ),
                  child: Stack(
                    children: [
                      Opacity(
                        opacity: 0.4, // Adjust the opacity value as desired
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
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
                                    color: backgroundcolor,
                                  ),
                                ),
                              ),
                              button2: GestureDetector(
                                onTap: () => favoritecontroller
                                    .addFavorite(favoriteItem),
                                child: GlassButton(
                                  icon: Icon(
                                    Icons.bookmark_border,
                                    color: backgroundcolor,
                                  ),
                                ),
                              ),
                              button3: GestureDetector(
                                onTap: (() => Share.share(url,subject: 'Share this content')),
                                child: GlassButton(
                                    icon: Icon(
                                  Icons.share,
                                  color: backgroundcolor,
                                )),
                              )),
                          SizedBox(
                            height: 70,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Text(
                                  category.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: navItems),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Text(
                                  title.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '. ${publishedat.toString()}',
                                  style: TextStyle(
                                      fontSize: 12, color: secondarycolor),
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //white area rounded corner section
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 15),
                        child: Row(
                          children: [
                            CircleAvatar(
                              child: Text(
                                name.toString().substring(0, 1),
                              ),
                              minRadius: 30,
                              maxRadius: 30,
                              backgroundColor: secondarycolor,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              name.toString(),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: _richText(
                            content.toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //rich text
  Widget _richText(String content) {
    return SelectableText.rich(
      style: TextStyle(fontFamily: 'Times new roman', color: Colors.black),
      TextSpan(
        children: [
          TextSpan(
            text: content.toString(),
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          TextSpan(
            text: '\n \nRead more \n',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: url.toString(),
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    );
  }
}
