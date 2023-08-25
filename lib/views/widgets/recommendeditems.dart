import 'package:flutter/material.dart';
import 'package:news_app/models/newsapi_model.dart';
import 'package:news_app/utils/api_auth.dart';

class RecommendedItems extends StatelessWidget {
  NewsApiModel? newsApiModel;
  RecommendedItems({
    super.key,
    this.newsApiModel
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child:_newsImage(context),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width/20,
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Text(
                    newsApiModel!.title.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          backgroundColor:  Theme.of(context).primaryColor,
                          foregroundColor: Colors.black,
                          child: Icon(Icons.person),
                          maxRadius: 15,
                          minRadius: 15),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          newsApiModel!.author.toString(),
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
    return SizedBox(
      height: 100,
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(12.0), // Set the desired border radius
        child: Image.network(
          newsApiModel!.urltoimage,
          fit: BoxFit.cover,
           loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Padding(
          padding: const EdgeInsets.all(10),
          child: CircularProgressIndicator(
            color: Colors.grey,
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
         errorBuilder: (context, error, stackTrace) {
        return Icon(Icons.error_outline,);
      },
        ), 
      ),
    );
  }
}
