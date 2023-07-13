import 'dart:convert';
import 'package:get/get.dart';
import 'package:news_app/models/youtubevideo_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/youtubevideo_model_search.dart';
import 'package:news_app/utils/constants.dart';

class VideoController extends GetxController {
  var videoData = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchVideo();
  }

  fetchVideo() async {
    try {
      String? nextPageToken; // Store the next page token
      final String apiUrl =
          'https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&key=${googleApikey}&accept=application/json';

      //till the end of json data repeat this procce of adding new tokens
      while (true) {
        final Uri uri = Uri.parse(apiUrl +
            (nextPageToken != null ? '&pageToken=$nextPageToken' : ''));
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final List<dynamic> items = jsonData['items'];

          for (var data in items) {
            videoData.add(YoutubeModel.fromJson(data));
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

      print('Total videos fetched: ${videoData.length}');
      print(videoData.last.channelTitle);
    } catch (e) {
      print('An error occurred: $e');
    }
  }

//search for items
  searchVideo(String query) async {
    try {
      videoData.clear(); // Clear the previous video data

      String? nextPageToken; // Store the next page token

      final String apiUrl =
          'https://youtube.googleapis.com/youtube/v3/search?part=snippet&maxResults=10&type=video&q=$query&key=$googleApikey&accept=application/json';

      while (true) {
        final Uri uri = Uri.parse(apiUrl +
            (nextPageToken != null ? '&pageToken=$nextPageToken' : ''));
        final http.Response response = await http.get(uri);

        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final List<dynamic> items = jsonData['items'];

          for (var data in items) {
            videoData.add(YoutubeModelSearch.fromJson(data));
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

      print('Total videos fetched: ${videoData.length}');
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
