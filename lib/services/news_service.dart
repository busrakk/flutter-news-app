import 'dart:convert';

import 'package:news/models/article.dart';
import 'package:http/http.dart' as http;
import 'package:news/models/news.dart';

class NewsService {
  Future<List<Article>> getNewsByCategory(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=tr&category=$category&apiKey=e1911124233c4c339c9c810ad32da12c";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final newsJson = json.decode(response.body); // json objesi
      News news = News.fromJSON(newsJson);
      return news.articles ?? [];
    }
    throw Exception("Internal Server Error"); // hata
  }
}
