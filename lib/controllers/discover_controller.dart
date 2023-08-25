import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/api_auth.dart';
import '../data/models/newsapi_model.dart';
import 'package:http/http.dart' as http;

class DiscoverController extends GetxController {
  RxList<NewsApiModel> _dataList = <NewsApiModel>[].obs;

  get dataList => _dataList.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData('/v2/everything', 'general');
  }

  // get data based on category
  fetchData(String endpoint, String query) async {
    try {
      _dataList.clear();
      final uri = Uri.https('newsapi.org', endpoint,
          {'q': query, 'sortBy': 'publishedAt', 'apikey': apikey});
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        for (var item in jsonData['articles']) {
          if (item['urlToImage'] != null) {
            _dataList.value.add(NewsApiModel.fromJson(item));
            _dataList.value = _dataList.value.reversed.toList();
          }
        }
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
