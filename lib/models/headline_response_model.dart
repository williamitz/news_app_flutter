// To parse this JSON data, do
//
//     final headlineResponseModel = headlineResponseModelFromMap(jsonString);

import 'dart:convert';

import 'package:news_app/models/article_model.dart';

class HeadlineResponseModel {
    HeadlineResponseModel({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    String status;
    int totalResults;
    List<Article> articles;

    factory HeadlineResponseModel.fromJson(String str) => HeadlineResponseModel.fromMap(json.decode(str));

    factory HeadlineResponseModel.fromMap(Map<String, dynamic> json) => HeadlineResponseModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
    );

}

