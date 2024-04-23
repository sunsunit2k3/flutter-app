import 'dart:convert';

import 'package:flutter_application_1/models/article.dart';
import 'package:http/http.dart' as http;

Future<List<Article>> getArticles(String? titleArticle) async {
  const url =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=96dedfef82ea49f8874251a6163f993b";
  final response = await http.get(Uri.parse(url));
  final body = json.decode(response.body) as Map<String, dynamic>;
  final List<Article> result = [];

  if (body["articles"] == null || body["articles"].isEmpty) {
    // Nếu không có dữ liệu hoặc dữ liệu rỗng, trả về danh sách kết quả rỗng
    return result;
  }

  bool hasMatchingArticle =
      false; // Biến cờ để kiểm tra xem có bài báo nào khớp không

  for (final articleData in body["articles"]) {
    final title = articleData["title"] as String?;
    final urlToImage = articleData["urlToImage"] as String?;
    final name = articleData["source"]["name"] as String?;
    final content = articleData["content"] as String?;

    // Kiểm tra xem titleArticle có khác null và không rỗng không
    if (titleArticle != null && titleArticle.isNotEmpty) {
      // Nếu có titleArticle, chỉ trả về bài báo có tiêu đề khớp với titleArticle
      if (title != null &&
          title.toLowerCase().contains(titleArticle.toLowerCase())) {
        result.add(Article(
          title: title,
          urlToImage: urlToImage ?? "",
          name: name ?? "",
          content: content ?? "",
        ));
        hasMatchingArticle = true; // Đánh dấu là đã tìm thấy bài báo khớp
      }
    } else {
      // Nếu không có titleArticle, trả về tất cả các bài báo
      if (title != null) {
        result.add(Article(
          title: title,
          urlToImage: urlToImage ?? "",
          name: name ?? "",
          content: content ?? "",
        ));
      }
    }
  }

  // Kiểm tra xem có bài báo khớp không, nếu không có, trả về thông báo rỗng
  if (titleArticle != null && titleArticle.isNotEmpty && !hasMatchingArticle) {
    return []; // Trả về danh sách kết quả rỗng
  }

  return result;
}
