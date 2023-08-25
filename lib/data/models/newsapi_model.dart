class NewsApiModel {
  var name;
  var author;
  var title;
  var description;
  var urltoimage;
  var publishedat; //datetime
  var content;
  var url;

  NewsApiModel(
      {this.name,
      this.author,
      this.title,
      this.description,
      this.urltoimage,
      this.publishedat,
      this.content,
      this.url});
 
 //to convert API data from json to model object
  NewsApiModel.fromJson(Map<String, dynamic> json) {
    name = json['source']['name'];
    author = json['author'];
    title = json['title'];
    description = json['description'];
    urltoimage = json['urlToImage'];
    publishedat = json['publishedAt'].toString().substring(0, 10);
    content = json['content'];
    url = json['url'];
  }

  //to convert sql data from json to model object
  NewsApiModel.sqlFromJson(Map<String, dynamic> json) {
    int startsrc = json['source'].toString().indexOf('=') + 1;
    int endsrc = json['source'].toString().indexOf('}');

    name = json['source'].toString().substring(startsrc, endsrc);
    author = json['author'];
    title = json['title'];
    description = json['description'];
    urltoimage = json['urlToImage'];
    publishedat = json['publishedAt'].toString().substring(0, 10);
    content = json['content'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['source'] = {'name': this.name};
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['urlToImage'] = this.urltoimage;
    data['publishedAt'] = this.publishedat;
    data['content'] = this.content;
    data['url'] = this.url;
    return data;
  }
}
