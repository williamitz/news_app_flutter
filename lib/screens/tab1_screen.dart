import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Tabs1Screen extends StatefulWidget {
  const Tabs1Screen({super.key});

  @override
  State<Tabs1Screen> createState() => _Tabs1ScreenState();
}

class _Tabs1ScreenState extends State<Tabs1Screen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final List<Article> articles = Provider.of<ArticlesProvider>(context).headlines;
    final bool loading = Provider.of<ArticlesProvider>(context).loading;

    return Scaffold(

      body: loading 
            ? const Center( child: CircularProgressIndicator() )
            : ListNews( articles: articles ),

    );
  }
  
  @override
  bool get wantKeepAlive => true;
}