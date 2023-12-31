import 'package:flutter/material.dart';
import 'package:news_app/controllers/discover_controller.dart';
import 'package:news_app/controllers/home_controller.dart';
import 'package:news_app/utils/api_auth.dart';
import 'package:news_app/views/detail/screens/detail_screen.dart';
import 'package:news_app/views/widgets/custombutton.dart';
import 'package:news_app/views/discover/widgets/customtextfield.dart';
import 'package:news_app/views/widgets/recommendeditems.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../widgets/recommendedshimmer.dart';
import '../widgets/list_items.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  DiscoverController discoverController = Get.put(DiscoverController());

  List<String> categories = [
    'General',
    'Sport',
    'Education',
    'Technology',
    'Health',
    'entertainment',
  ];

  int selectedIndex = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    discoverController.fetchData('/v2/everything', 'general');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 15, top: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'News from all around the world',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CustomTextField(
              endpoint: '/v2/everything',
              query: categories[selectedIndex],
              getcontroller: discoverController,
              icon: FaIcon(
                FontAwesomeIcons.earth,
                size: 25,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 35,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: ((context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(categories[index]),
                    selected: selectedIndex == index,
                    onSelected: (bool selected) {
                      setState(() {
                        selectedIndex = index;
                      });
                      categories[0] = 'general';
                      discoverController.fetchData('/v2/everything',
                          categories[selectedIndex].toLowerCase());
                    },
                    selectedColor: Colors.blue,
                    labelStyle: TextStyle(
                      color:
                          selectedIndex == index ? Colors.white : Colors.black,
                    ),
                  ))),
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ListItems()
        ],
      ),
    );
  }
}
