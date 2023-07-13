import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';

class RecommendedItems extends StatelessWidget {
  var imageUrl;
  var title;
  var author;

  RecommendedItems({super.key,required this.imageUrl,required this.title,required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: _newsImage(context),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'General',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    title.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor: secondarycolor,
                          foregroundColor: primerycolor,
                          child: Icon(Icons.person),
                          maxRadius: 15,
                          minRadius: 15),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          author.toString(),
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _newsImage(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(12.0), // Set the desired border radius
      child: Image.network(
        imageUrl,
      ), // Replace with your image asset
    );
  }
}
