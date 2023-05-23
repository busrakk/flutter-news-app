import 'package:flutter/material.dart';
import 'package:news/services/news_service.dart';
import 'package:news/viewmodel/article_view_model.dart';

enum Status {
  empty(1), // istek henüz başlamadı
  loading(2),
  received(3);

  const Status(this.value);

  final int value;
}

class ArticleListViewModel extends ChangeNotifier {
  ArticleViewModel viewModel = ArticleViewModel('general', []);
  Status status = Status.empty; // istek hangi aşamada

  // ekran ilk açıldığında bütün haberler çekilsin
  ArticleListViewModel() {
    getNews('general');
  }

  Future<void> getNews(String category) async {
    status = Status.loading;
    notifyListeners(); // statusun değiştiğini haber verir

    viewModel.articles = await NewsService().getNewsByCategory(category);
    status = Status.received;
    notifyListeners();
  }
}
