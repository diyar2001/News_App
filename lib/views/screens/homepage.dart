import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/views/screens/video_screen.dart';
import 'package:news_app/views/screens/detail_screen.dart';
import 'package:news_app/views/screens/favorite_screen.dart';
import 'package:news_app/views/screens/home_screen.dart';
import 'package:news_app/views/widgets/appbar.dart';
import 'package:news_app/views/widgets/newsitems.dart';
import 'package:news_app/views/widgets/recommendeditems.dart';
import '../widgets/custombutton.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../screens/discover_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';



class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;

  final List<Widget> _screens = [
     HomeScreen(),
    const DiscoverScreen(),
     FavoriteScreen(),
     VideoScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedindex], //switch between screens 0,1,2 ...
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _selectedindex,
          onTap: (i) => setState(() => _selectedindex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
              title: Text("Home"),
              selectedColor: navItems,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: FaIcon(
                FontAwesomeIcons.earth,
                size: 25,
              ),
              title: Text("Descover"),
              selectedColor: navItems,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(
                Icons.bookmark_outline,
                size: 30,
              ),
              title: Text("Favorite"),
              selectedColor: navItems,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(
                Icons.video_collection_outlined,
                size: 30,
              ),
              title: Text("Video"),
              selectedColor: navItems,
            ),
          ],
        ),
      ),
    );
  }
}
