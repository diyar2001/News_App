import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/utils/api_auth.dart';
import '../data/models/newsapi_model.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:news_app/sqlhelper.dart';

class FavoriteController extends GetxController {
  SqlHelper sqldb = SqlHelper();
  RxList<NewsApiModel> _favoriteData = <NewsApiModel>[].obs;

  get favoriteData => _favoriteData.value;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    getFavorite();
  }

//add item into favorite list
  void addFavorite(NewsApiModel newsItem) async {
    try {
      bool isExistingItem =
          _favoriteData.any((item) => item.title == newsItem.title);
      if (isExistingItem) {
        debugPrint('true');
        Get.snackbar(
          'Existing',
          'This item is already exist',
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 50,
          colorText: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.all(10),
        );
      } else {
        debugPrint('false');
        _favoriteData.clear();
        sqldb.addItem(newsItem.toJson()).then((value) => Get.snackbar(
              'Done',
              'successfully added into favorites list',
              snackPosition: SnackPosition.BOTTOM,
              borderRadius: 50,
              colorText: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.all(10),
            ));
        getFavorite();
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  ///get all items form favorite sharedpref list
  getFavorite() async {
    try {
      final list = await sqldb.getAllItems();
      final uniqueData = <NewsApiModel>[];

      for (var json in list) {
        final newsItem = NewsApiModel.sqlFromJson(json);
        if (!uniqueData.any((item) => item.title == newsItem.title)) {
          uniqueData.add(newsItem);
        }
      }

      _favoriteData.assignAll(uniqueData);
    } catch (e) {
      print(e);
    }
  }

  //remove items form list of favorites
  removeAll() {
    try {
      if (_favoriteData.isNotEmpty) {
        sqldb.removeAll().then((value) => Get.snackbar(
            'Done', 'All datas successfully deleted',
            snackPosition: SnackPosition.BOTTOM,
            borderRadius: 50,
            colorText: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 70)));
        getFavorite();
      } else {
        Get.snackbar('Empty', 'The favorite list is already empty',
            snackPosition: SnackPosition.BOTTOM,
            borderRadius: 50,
            colorText: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 70));
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  removeThis(String id) {
    try {
      sqldb.removeItem(id).then((value) => Get.snackbar(
          'Done', 'This item successfully deleted',
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 50,
          colorText: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 70)));
      getFavorite();
    } catch (e) {
      print(e);
    }
  }

//get item by title
  getItem(String searchText) {
    try {
      List<NewsApiModel> filteredList = _favoriteData
          .where((item) =>
              item.title.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      _favoriteData.assignAll(filteredList);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
