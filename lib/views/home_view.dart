import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/news_tile.dart';
import 'package:news_app_ui_setup/widgets/category_card.dart';

import '../models/article_model.dart';
import '../service/news_service.dart';
import '../widgets/category_list_view.dart';
import '../widgets/news_list_view.dart';
import '../widgets/news_list_view_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ' News',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                ' Cloud',
                style: TextStyle(color: Colors.orange),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: CategoryListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 24,
                ),
              ),
              NewsListViewBuider(category: 'general'),
            ],
          ),
          // child: Column(
          //   children: [
          //     CategoryListView(),
          //     SizedBox(
          //       height: 24,
          //     ),
          //     Expanded(child: NewsListView()),
          //   ],
          // ),
        ));
  }
}
