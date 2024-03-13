import 'dart:convert';

import 'package:flutter_application_1/models/article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> getArticles() async {
  const url =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=96dedfef82ea49f8874251a6163f993b";
  final response = await http.get(Uri.parse(url));
  final body = json.decode(response.body) as Map<String, dynamic>;
  final List<Article> result = [];
  for (final articleData in body["articles"]) {
    final title = articleData["title"] as String?;
    final urlToImage = articleData["urlToImage"] as String?;
    final name = articleData["source"]["name"] as String?;
    final content = articleData["content"] as String?;

    // Kiểm tra xem bất kỳ trường nào của bài báo nào là null không
    if (title != null &&
        urlToImage != null &&
        name != null &&
        content != null) {
      result.add(Article(
        title: title,
        urlToImage: urlToImage,
        name: name,
        content: content,
      ));
    }
  }
  return result;
}
