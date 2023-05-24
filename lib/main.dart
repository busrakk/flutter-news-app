import 'package:flutter/material.dart';
import 'package:news/pages/news_page.dart';
import 'package:news/viewmodel/article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => ArticleListViewModel(),
        child: const NewsPage(), // uygulama ilk açıldığında gelecek ekran
      ),
    );
  }
}
