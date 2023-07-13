import 'dart:convert';
import 'package:get/get.dart';
import 'package:news_app/utils/constants.dart';
import '../models/newsapi_model.dart';
import 'package:http/http.dart' as http;

class DiscoverController extends GetxController {
  RxList<NewsApiModel> dataList = <NewsApiModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData('/v2/everything', 'general');
  }

  // get data based on category
  fetchData(String endpoint, String query) async {
    try {
      dataList.clear();
      final uri =
          Uri.https('newsapi.org', endpoint, {'q': query,'sortBy':'publishedAt', 'apikey': apikey});
      final response = await http.get(uri);
      print(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        for (var item in jsonData['articles']) {
          if (item['urlToImage'] != null) {
            dataList.add(NewsApiModel.fromJson(item));
            dataList.value = dataList.reversed.toList();
          }
        }
        print(dataList.length);
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
