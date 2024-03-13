import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/date_now.dart';
import 'package:flutter_application_1/data/get_article.dart';
import 'package:flutter_application_1/pages/home/article_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getArticles();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              // ignore: unnecessary_string_interpolations
              '${getCurrentDate()}',
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontFamily: "Raleway",
                fontSize: 15.0,
              ),
            ),
            const Text(
              "Explore",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "Times New Roman",
              ),
            )
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[300],
      ),
      body: FutureBuilder(
        future: getArticles(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              final data = snapshot.data ?? [];
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  if (data[index].urlToImage == null) return const SizedBox();
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ListTile(
                      title: Column(
                        children: [
                          Text(
                            data[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                          ),

                          const SizedBox(
                              height: 5), // Khoảng cách giữa title và author
                          Padding(
                            padding: const EdgeInsets.only(left: 220.0),
                            child: Text(
                              'By: ${data[index].name}',
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        ],
                      ),
                      leading: FadeInImage(
                        placeholder: const AssetImage(
                            '../../../assets/img.gif'), // Hình ảnh mặc định hiển thị trong khi hình ảnh thực tế đang được tải
                        image: NetworkImage(data[index].urlToImage ?? ''),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          // Xử lý khi không thể tải được hình ảnh
                          return Image.asset(
                            '../../../assets/img.gif', // Sử dụng hình ảnh từ assets làm placeholder khi không thể tải được ảnh từ mạng
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetailScreen(
                              title: data[index].title,
                              urlToImage: data[index].urlToImage ?? '',
                              name: data[index].name,
                              content: data[index].content ?? '',
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
