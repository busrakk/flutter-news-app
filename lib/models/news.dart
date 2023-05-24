import 'package:news/models/article.dart';

class News {
  String? status;
  int? totalResults;
  List<Article>? articles;

  // constructor
  News({this.status, this.totalResults, this.articles});

  News.fromJSON(Map<String, dynamic> json) {
    status = json["status"];
    totalResults = json["totalResults"];
    if (json['articles'] != null) {
      articles = <Article>[]; // arrticle nesnesinden türetilmiş boş liste
      // articles, Article nesnelerini tutan boş bir listedir.
      json["articles"].forEach((articleJSON) {
        articles!.add(Article.fromJSON(articleJSON));
      });
    }
  }

  Map<String, dynamic> toJSON() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["totalResults"] = totalResults;
    if (articles != null) {
      data["articles"] = articles!.map((e) => e.toJSON());
    }

    return data;
  }
}
