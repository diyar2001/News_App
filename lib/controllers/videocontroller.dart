import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/models/youtubevideo_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/youtubevideo_model_search.dart';
import 'package:news_app/utils/api_auth.dart';

class VideoController extends GetxController {
  /// videoData list for saving url,title,pulisher
  var _videoData = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchVideo();
  }

  get videoData => _videoData.value;

  ///
  ///
  ///fetching videos from YouTube API
  fetchVideo() async {
    try {
      String? nextPageToken; // Store the next page token
      final String apiUrl =
          'https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&key=${googleApikey}&accept=application/json';

      //till the end of json data repeat this procce of adding new tokens
      for (int i = 0; i < 10; i++) {
        final Uri uri = Uri.parse(apiUrl +
            (nextPageToken != null ? '&pageToken=$nextPageToken' : ''));
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final List<dynamic> items = jsonData['items'];

          for (var data in items) {
            _videoData.value.add(YoutubeModel.fromJson(data));
          }

          nextPageToken = jsonData['nextPageToken']; // Get the next page token

          if (nextPageToken == null) {
            // No more pages available, exit the loop
            break;
          }
        } else {
          print('Failed to fetch videos. Status code: ${response.statusCode}');
          break;
        }
      }

      debugPrint('Total videos fetched: ${_videoData.value.length}');
    } catch (e) {
      print('An error occurred: $e');
    }
  }

//
//
//search for videos from YouTube API
  searchVideo(String query) async {
    try {
      _videoData.value.clear(); // Clear the previous video data

      String? nextPageToken; // Store the next page token

      final String apiUrl =
          'https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&type=video&q=$query&key=$googleApikey&accept=application/json';

      for (int i = 0; i < 10; i++) {
        final Uri uri = Uri.parse(apiUrl +
            (nextPageToken != null ? '&pageToken=$nextPageToken' : ''));
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final List<dynamic> items = jsonData['items'];

          for (var data in items) {
            _videoData.value.add(YoutubeModelSearch.fromJson(data));
          }

          nextPageToken = jsonData['nextPageToken']; // Get the next page token
          print(nextPageToken);
          if (nextPageToken == null) {
            // No more pages available, exit the loop
            break;
          }
        } else {
          print('Failed to fetch videos. Status code: ${response.statusCode}');
          break;
        }
      }

      print('Total videos fetched: ${_videoData.value.length}');
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
