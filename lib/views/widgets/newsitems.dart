import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';

class NewsItem extends StatelessWidget {
  var imageUrl;
  var name;
  var title;
  var publishedat;
  NewsItem({super.key, required this.imageUrl, required this.name, required this.title, required this.publishedat});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: Image.network(imageUrl).image,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.4, // Adjust the opacity value as desired
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (() => print('')),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      'General',
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: navItems),
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
                Row(
                  children: [
                    Text(
                      name.toString(),
                      style:
                          TextStyle(color: Color.fromARGB(255, 209, 202, 202)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '. ${publishedat}',
                      style:
                          TextStyle(color: Color.fromARGB(255, 209, 202, 202)),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 55,
                  width: 250,
                  child: Text(
                    '${title}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
