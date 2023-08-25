import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/models/newsapi_model.dart';
import 'package:news_app/utils/api_auth.dart';
import 'package:news_app/views/screens/home_screen.dart';
import 'package:news_app/views/widgets/appbar.dart';
import 'package:news_app/views/widgets/glassbutton.dart';
import 'package:get/get.dart';
import '../../controllers/favorite_controller.dart';
import 'package:share_plus/share_plus.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    super.key,
  });

  final NewsApiModel newsApiModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    FavoriteController favoritecontroller = Get.put(FavoriteController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height / 1.95,
          floating: false,
          pinned: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 100),
              child: Container(
                height: MediaQuery.of(context).size.height / 10,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Text(
                          newsApiModel.name.toString().substring(0, 1),
                        ),
                        minRadius: 30,
                        maxRadius: 30,
                        backgroundColor: Color.fromARGB(255, 219, 217, 217),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        newsApiModel.name.toString(),
                      )
                    ],
                  ),
                ),
              )),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background:
                //section one
                Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.network(newsApiModel.urltoimage).image,
                    fit: BoxFit.cover),
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
                            onTap: () =>
                                favoritecontroller.addFavorite(newsApiModel),
                            child: GlassButton(
                              icon: Icon(
                                Icons.bookmark_border,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          button3: GestureDetector(
                            onTap: (() => Share.share(newsApiModel.url,
                                subject: 'Share this content')),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                        height: MediaQuery.of(context).size.height/10,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                                  fontSize: 13,
                                  color: Theme.of(context).primaryColor),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverFillRemaining(
            child:
                //section two
                Container(
          height: MediaQuery.of(context).size.height / 4,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: _richText(
                  newsApiModel.content.toString(),
                ),
              ),
            ],
          ),
        ))
      ]),
    ));
  }

  //rich text
  Widget _richText(String content) {
    return SelectableText.rich(
      style:
          const TextStyle(fontFamily: 'Times new roman', color: Colors.black),
      TextSpan(
        children: [
          TextSpan(
            text: content.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          const TextSpan(
            text: '\n \nRead more \n',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.toNamed('/Webpage',
                  arguments: newsApiModel.url.toString()),
            text: newsApiModel.url.toString(),
            style: const TextStyle(fontSize: 16, color: Colors.blue,decoration: TextDecoration.underline),
          ),
        ],
      ),
      textAlign: TextAlign.justify,
    );
  }
}
