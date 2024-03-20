import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article.dart';
import 'package:flutter_application_1/widgets/article/article_tile.dart';
import 'package:flutter_application_1/utils/date_now.dart';
import 'package:flutter_application_1/data/get_article.dart';
import 'package:flutter_application_1/widgets/article/categories_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Article> originalArticles;
  late List<Article> displayedArticles;
  late Future<List<Article>> articles;

  @override
  void initState() {
    super.initState();
    articles = getArticles();
    articles.then((articles) {
      setState(() {
        originalArticles = articles;
        displayedArticles = articles;
      });
    });
  }

  void search(String query) {
    setState(() {
      displayedArticles = originalArticles
          .where((article) =>
              article.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(getCurrentDate()),
              const Text(
                'Explore',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                clipBehavior: Clip.antiAlias,
                child: TextFormField(
                  onChanged: search,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search for article',
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const SizedBox(
                height: 40,
                child: CategoriesBar(),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ArticleList(articles: displayedArticles), // Sửa ở đây
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleList extends StatelessWidget {
  final List<Article> articles; // Sửa ở đây

  const ArticleList({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(right: 16.0),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ArticleTile(
          article: articles[index],
        );
      },
    );
  }
}
