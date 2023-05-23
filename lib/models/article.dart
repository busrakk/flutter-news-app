import 'package:news/models/source.dart';

class Article {
  Source? source; // source classından türetilmiş nesne
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  // constructed
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJSON(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJSON(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> dataJSON = <String, dynamic>{};
    if (source != null) {
      dataJSON['source'] = source; // {"id":"12233", "name":"skjfkjs"}
    }
    dataJSON['author'] = author;
    dataJSON['title'] = title;
    dataJSON['description'] = description;
    dataJSON['url'] = url;
    dataJSON['urlToImage'] = urlToImage;
    dataJSON['publishedAt'] = publishedAt;
    dataJSON['content'] = content;

    return dataJSON;
  }
}
