import 'dart:convert';
import 'package:get/get.dart';
import 'package:news_app/utils/constants.dart';
import '../models/newsapi_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxList<NewsApiModel> breakingList = <NewsApiModel>[].obs;
  RxList<NewsApiModel> recommendedList = <NewsApiModel>[].obs;
  RxInt recommendListLength = 5.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBreakNews('/v2/top-headlines', 'general');
    getRecommendedNews('/v2/everything', 'general');
  }

// get breaking news
  getBreakNews(String endpoint, String query) async {
    try {
      final uri =
          Uri.https('newsapi.org', endpoint, {'q': query, 'apikey': apikey});
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print(jsonData['totalResults']);
        for (var item in jsonData['articles']) {
          if (item['urlToImage'] != null) {
            breakingList.add(NewsApiModel.fromJson(item));
          }
        }
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }




//get data for recommended section
  getRecommendedNews(String endpoint, String query) async {
    try {
      final uri =
          Uri.https('newsapi.org', endpoint, {'q': query,'sortBy':'popularity', 'apikey': apikey});
      final response = await http.get(uri);
      print(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print(jsonData['totalResults']);
        for (var item in jsonData['articles']) {
          if (item['urlToImage'] != null) {
            recommendedList.add(NewsApiModel.fromJson(item));
            recommendedList.value = recommendedList.reversed.toList();
          }
        }
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }



//expand list to view all items change length from 4 to all
  viewAll() {
    recommendListLength.value = recommendedList.value.length;
    print(recommendListLength);
  }
}
