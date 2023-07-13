import 'package:flutter/foundation.dart';

class YoutubeModel {
 late String id;
 late String title;
 late String publishedAt;
 late String channelTitle;
 late String viewCount;
 late String likeCount;

  YoutubeModel({
    required this.id,
    required this.publishedAt,
    required this.channelTitle,
    required this.viewCount,
    required this.likeCount,
    required this.title,
  });

  YoutubeModel.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['snippet']['title'];
    publishedAt = data['snippet']['publishedAt'];
    channelTitle = data['snippet']['channelTitle'];
    viewCount = data['statistics']['viewCount'];
    likeCount = data['statistics']['likeCount'];
  }
}
