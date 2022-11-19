import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/headline_response_model.dart';

class NewsApiService {
  
  final String _apiKey = 'e13c98a15cfe4b4db1dde84ebe382785';

  final String _baseUrl = 'newsapi.org';

  int _headlinePage = 1;
  int _headlinePageByCategory = 1;


  Future<List<Article>> onGetArticles() async {

    final queryParams = {
      "country": "ar",
      "category": "business",
      'apiKey': _apiKey,
      'pageSize': '5',
      'page': _headlinePage.toString()
    };

    final headlineUri = Uri.https( _baseUrl, '/v2/top-headlines', queryParams );

    _headlinePage++;

    final headlineResponse = await _onExecuteHttp( headlineUri );

    return headlineResponse.articles;
  }

  Future<List<Article>> onGetArticlesByCategory( String category ) async {

    final queryParams = {
      "country": "ar",
      "category": category,
      'apiKey': _apiKey,
      'pageSize': '5',
      'page': _headlinePageByCategory.toString()
    };

    final headlineUri = Uri.https( _baseUrl, '/v2/top-headlines', queryParams );
    
    _headlinePageByCategory++;

    final headlineResponse = await _onExecuteHttp( headlineUri );

    return headlineResponse.articles;
  }

  Future<HeadlineResponseModel> _onExecuteHttp( Uri url,  ) async {

    try {

      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        
        final jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;

        return HeadlineResponseModel.fromMap( jsonResponse );

      } else {
        print('Request failed with status: ${response.statusCode}.');
      }


      return HeadlineResponseModel( articles: [], status: 'failed', totalResults: 0 );

    } catch (e) {
      return HeadlineResponseModel( articles: [], status: 'failed', totalResults: 0 );
    }

  }

}