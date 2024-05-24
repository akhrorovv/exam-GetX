import 'package:exam/models/article_model.dart';
import 'package:flutter/material.dart';

import '../services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<Article> articles = [];

  _loadArticles() async {
    var response = await Network.GET(Network.API_GET_INFOS, Network.paramsArticle());
    List<Article> articlesList = Network.parseArticles(response!);
    print(articlesList.length);
    setState(() {
      articles = articlesList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index){
              return itemOfArticle(articles[index]);
            },
          )
        ],
      ),
    );
  }

  Widget itemOfArticle(Article article) {
    return Container(
      child: Column(
        children: [

        ],
      ),
    );
  }
}
