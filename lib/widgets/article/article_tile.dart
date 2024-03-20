import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({Key? key, required this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128,
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              article.urlToImage ?? '',
              fit: BoxFit.cover,
              height: 128,
              width: 128,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 128,
                  width: 128,
                  color: Colors.lightBlue,
                );
              },
            ),
          ),
          const SizedBox(width: 8), // Thêm khoảng cách giữa ảnh và tiêu đề
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    article.title,
                    maxLines: 2, // Giới hạn số dòng tối đa là 2
                    overflow: TextOverflow
                        .ellipsis, // Hiển thị dấu ... khi vượt quá số dòng cho phép
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  article.name,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
