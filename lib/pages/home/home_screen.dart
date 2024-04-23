import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article.dart';
import 'package:flutter_application_1/widgets/article/article_tile.dart';
import 'package:flutter_application_1/utils/date_now.dart';
import 'package:flutter_application_1/apis/get_article.dart';
import 'package:flutter_application_1/widgets/article/categories_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Article> originalArticles;
  late List<Article> displayedArticles = []; // Initialize displayedArticles
  late Future<List<Article>> articles;

  @override
  void initState() {
    super.initState();
    articles = getArticles(null); // Truyền vào null để lấy tất cả các bài báo
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
                child: FutureBuilder<List<Article>>(
                  future: getArticles(null),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const Center(child: CircularProgressIndicator());
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          final List<Article>? articles = snapshot.data;
                          if (articles != null && articles.isNotEmpty) {
                            return ArticleList(articles: displayedArticles);
                          } else {
                            return const Center(
                                child: Text('No articles found.'));
                          }
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          return const Center(
                              child: Text('No data available.'));
                        }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleList extends StatelessWidget {
  final List<Article> articles;

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
