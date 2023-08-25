class YoutubeModelSearch {
  late String id;
  late String title;
  late String publishedAt;
  late String channelTitle;


  YoutubeModelSearch({
    required this.id,
    required this.title,
    required this.publishedAt,
    required this.channelTitle,

  });

  factory YoutubeModelSearch.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'];

    return YoutubeModelSearch(
      id: json['id']['videoId'],
      title: snippet['title'],
      publishedAt: snippet['publishedAt'],
      channelTitle: snippet['channelTitle'],
    );
  }
}
