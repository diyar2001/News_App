import 'package:flutter/material.dart';
import 'package:news_app/data/models/newsapi_model.dart';
import 'package:news_app/views/detail/widgets/appbar.dart';
import 'package:news_app/views/widgets/glassbutton.dart';
import 'package:get/get.dart';
import '../../../controllers/favorite_controller.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/prefiredsize_section.dart';
import '../widgets/rich_textsection.dart';
import '../widgets/top_spacebar.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    super.key,
  });

  final NewsApiModel newsApiModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(slivers: [
        //two parts appbar and remaining section
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height / 1.95,
          floating: false,
          pinned: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 100),
              child: PrefiredSizeSection(
                name: newsApiModel.name,
              )),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background:
                //section one
               TopSpaceBarBox(
                newsApiModel: newsApiModel,
               )
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
                child: RichTextSection(
                    content: newsApiModel.content.toString(),
                    url: newsApiModel.url.toString()),
              ),
            ],
          ),
        ))
      ]),
    ));
  }
}
