import 'package:flutter/material.dart';
import 'package:news/models/news_category.dart';
import 'package:news/viewmodel/article_list_view_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsCategory> categories = [
    NewsCategory("business", "iş"),
    NewsCategory("entertainment", "eğlence"),
    NewsCategory("general", "genel"),
    NewsCategory("health", "sağlık"),
    NewsCategory("science", "bilim"),
    NewsCategory("sports", "spor"),
    NewsCategory("technology", "teknoloji"),
  ];

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ArticleListViewModel>(context); // tüm dataya erişir

    return Scaffold(
      appBar: AppBar(
        title: const Text("My News App"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getCategoriesTab(vm),
            ), // yatayda scroll
          ),
          getWidgetByStatus(
            vm,
          )
        ],
      ),
    );
  }

  Widget getWidgetByStatus(ArticleListViewModel vm) {
    switch (vm.status.value) {
      case 3:
        return Expanded(
          child: ListView.builder(
            itemCount: vm.articleViewModel.articles.length,
            itemBuilder: (context, index) => Card(
              child: Column(
                children: [
                  Image.network(vm
                          .articleViewModel.articles[index].urlToImage ??
                      "https://t4.ftcdn.net/jpg/04/99/93/31/360_F_499933117_ZAUBfv3P1HEOsZDrnkbNCt4jc3AodArl.jpg"),
                  ListTile(
                    title:
                        Text(vm.articleViewModel.articles[index].title ?? '--'),
                    subtitle: Text(
                        vm.articleViewModel.articles[index].description ??
                            '--'),
                  ),
                  ButtonBar(
                    children: [
                      MaterialButton(
                        onPressed: () async {
                          await launchUrl(Uri.parse(
                              vm.articleViewModel.articles[index].url ?? ''));
                        },
                        child: const Text(
                          "Details...",
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );

      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }

  List<GestureDetector> getCategoriesTab(ArticleListViewModel vm) {
    List<GestureDetector> categoryTabList = [];
    for (int i = 0; i < categories.length; i++) {
      categoryTabList.add(GestureDetector(
        onTap: () => vm.getNews(categories[i].key),
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                categories[i].title,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ));
    }
    return categoryTabList;
  }
}
