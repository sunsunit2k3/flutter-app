import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String title;
  final String? urlToImage;
  final String name;
  final String? content;

  const ArticleDetailScreen({
    super.key,
    required this.title,
    required this.urlToImage,
    required this.name,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Detail Article")),
        actions: [
          IconButton(
            icon: const Icon(Icons.newspaper),
            onPressed: () {
              saveArticle();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: FadeInImage(
                placeholder: const AssetImage(
                    '../../../assets/img.gif'), // Hình ảnh mặc định hiển thị trong khi hình ảnh thực tế đang được tải
                image: NetworkImage(urlToImage ?? ''),
                width: 500,
                height: 300,
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  // Xử lý khi không thể tải được hình ảnh
                  return Image.asset(
                    '../../../assets/img.gif', // Sử dụng hình ảnh từ assets làm placeholder khi không thể tải được ảnh từ mạng
                    width: 500,
                    height: 300,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                content!,
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveArticle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Kiểm tra xem bài báo đã được lưu trước đó hay chưa
    int index = 0;
    bool isSaved = false;
    while (prefs.containsKey("title_$index")) {
      String savedTitle = prefs.getString("title_$index") ?? '';
      if (savedTitle == title) {
        isSaved = true;
        break;
      }
      index++;
    }

    // Nếu bài báo chưa được lưu trước đó, lưu thông tin của nó
    if (!isSaved) {
      await prefs.setString("title_$index", title);
      await prefs.setString("urlToImage_$index", urlToImage ?? '');
      await prefs.setString("name_$index", name);
      await prefs.setString("content_$index", content ?? '');

      // In ra dữ liệu đã lưu
      print('Saved article:');
      print('Title: $title');
      print('Url To Image: ${urlToImage ?? ''}');
      print('Name: $name');
      print('Content: ${content ?? ''}');
    } else {
      print('Article is already saved');
    }
  }
}
