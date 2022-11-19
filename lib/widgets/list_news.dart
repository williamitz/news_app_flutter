import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/widgets.dart';

class ListNews extends StatelessWidget {

  final List<Article> articles;

  const ListNews({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: ( BuildContext _, int i ) {

        return CardNew( article: articles[i], index: i );

      },
    );
  }
}

