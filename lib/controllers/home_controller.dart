import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/api_auth.dart';
import '../data/models/newsapi_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final RxList<NewsApiModel> _breakingList = <NewsApiModel>[].obs;
  final RxList<NewsApiModel> _recommendedList = <NewsApiModel>[].obs;
  final RxInt _recommendListLength = 5.obs;
  final Rx<ViewAllState> _viewAllState = ViewAllState.viewAll.obs;
  final RxInt _activeIndex = 0.obs;

  List<NewsApiModel> get breakingList => _breakingList.value;
  List<NewsApiModel> get recommendedList => _recommendedList.value;
  int get recommendListLength => _recommendListLength.value;
  ViewAllState get viewAllState => _viewAllState.value;
  int get activeIndex => _activeIndex.value;




 

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBreakingNews('/v2/top-headlines', 'general');
    getRecommendedNews('/v2/everything', 'general');
  }


//set current index for carousel slider
 int setActiveIndex(int index) {
    _activeIndex.value = index;
    return _activeIndex.value;
  }



// get breaking news
  getBreakingNews(String endpoint, String query) async {
    try {
      final uri =
          Uri.https('newsapi.org', endpoint, {'q': query,'apikey': apikey});
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        for (var item in jsonData['articles']) {
          if (item['urlToImage'] != null) {
            _breakingList.add(NewsApiModel.fromJson(item));
          }
        }
      } else {
        debugPrint(response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }



//get data for recommended section
  getRecommendedNews(String endpoint, String query) async {
    try {
      final uri = Uri.https('newsapi.org', endpoint,
          {'q': query, 'sortBy': 'popularity', 'apikey': apikey});
      final response = await http.get(uri);
      print(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        print(jsonData['totalResults']);
        for (var item in jsonData['articles']) {
          if (item['urlToImage'] != null) {
            _recommendedList.value.add(NewsApiModel.fromJson(item));
            _recommendedList.value = _recommendedList.value.reversed.toList();
          }
        }
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }



///
///
///
//expand list to view all items change length from 4 to all
  viewAll() async {
    _viewAllState.value = ViewAllState.wait;

    //creating 2 seconds delay for better user expiriance
    await Future.delayed(const Duration(seconds: 1), () {});
    _recommendListLength.value = _recommendedList.length;
    _viewAllState.value = ViewAllState.remove;
  }
}

//when i click on view all button i have
//Three cases instead of using bool it only True,False
enum ViewAllState { viewAll, wait, remove }
