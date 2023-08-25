import 'package:flutter/material.dart';
import 'package:news_app/data/models/newsapi_model.dart';
import 'package:news_app/utils/api_auth.dart';

class NewsItem extends StatelessWidget {
  NewsApiModel? newsApiModel;
  NewsItem(
      {super.key,
      this.newsApiModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: Image.network(newsApiModel!.urltoimage).image,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.4, 
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 20,left: 20, top: MediaQuery.of(context).size.height/90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    'General',
                    style: TextStyle(color:Colors.white),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).accentColor),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/10,
                ),
                Row(
                  children: [
                    Text(
                      newsApiModel!.name.toString(),
                      style:
                          TextStyle(color: Color.fromARGB(255, 209, 202, 202)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '. ${newsApiModel!.publishedat}',
                      style:
                          TextStyle(color: Color.fromARGB(255, 209, 202, 202)),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Text(
                    '${newsApiModel!.title}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
