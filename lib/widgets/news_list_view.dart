import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/service/news_service.dart';

import '../views/news_tile.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    required this.articles,
    super.key,
  });

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Newstile(
            articleModel: articles[index],
          );
        },
      ),
    );
  }
}
