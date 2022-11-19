import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Icons;

import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/services/news_api_service.dart';

class ArticlesProvider with ChangeNotifier {
  
  List<Article> _headlines = [];
  Map<String, List<Article>> _headlinesByCategory = {
    'business': [],
    'entertainment': [],
    'general': [],
    'sports': [],
    'tecnology': []
  };

  final List<CategoryModel> _categories = [
    CategoryModel( Icons.business_sharp , 'business'),
    CategoryModel( Icons.tv , 'entertainment'),
    CategoryModel( Icons.list , 'general'),
    CategoryModel( Icons.sports_soccer , 'sports'),
    CategoryModel( Icons.phone_android_outlined , 'tecnology'),
  ];

  String _selectedCaregory = 'business';

  final NewsApiService _newsApi =  NewsApiService();

  bool _loading = false;
  bool _loadingByCategory = false;

  bool get loading => _loading;
  bool get loadingByCategory => _loadingByCategory;
  String get selectedCaregory => _selectedCaregory;
  set selectedCaregory( String val ) {
    _selectedCaregory = val;
    onLoadHeadlinesByCategory();
  }
  int get countcategory => _categories.length;
  List<CategoryModel> get categories => _categories;

  List<Article> get headlines => _headlines;
  List<Article> get headlinesByCategory => _headlinesByCategory[ _selectedCaregory ] ?? [];

  ArticlesProvider() {
    onLoadHeadlines();
    onLoadHeadlinesByCategory();
  }

  Future<void> onLoadHeadlines() async {

    _loading = true;
    notifyListeners();

    final List<Article> articles = await _newsApi.onGetArticles();

    _headlines.addAll( articles );

    _loading = false;
    notifyListeners();

  }

  Future<void> onLoadHeadlinesByCategory() async {

    _loadingByCategory = true;
    notifyListeners();

    final List<Article> articles = await _newsApi.onGetArticlesByCategory( _selectedCaregory );

    _headlinesByCategory[ _selectedCaregory ]!.addAll( articles );
 
    _loadingByCategory = false;
    notifyListeners();

  }


}