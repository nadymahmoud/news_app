import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/article_model.dart';
import '../service/news_service.dart';
import 'news_list_view.dart';

class NewsListViewBuider extends StatefulWidget {
  @override
  final String category;

  const NewsListViewBuider({super.key, required this.category});
  State<NewsListViewBuider> createState() => _NewsListViewBuiderState();
}

class _NewsListViewBuiderState extends State<NewsListViewBuider> {
  var future;
  @override
  void initState() {
    future = NewsService(Dio()).getTopHeadline(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return const SliverToBoxAdapter(
                child: Center(
              child: Text('oops , there was an error , try later'),
            ));
          } else {
            return const SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
