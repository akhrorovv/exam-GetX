import 'package:exam/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/home_controller.dart';
import '../services/http_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[300],
        title: Text(
          'All articles about Tesla',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          return Stack(
            children: [
              ListView.builder(
                itemCount: homeController.articles.length,
                itemBuilder: (context, index) {
                  return itemOfArticle(homeController.articles[index], index);
                },
              )
            ],
          );
        },
      ),
    );
  }

  Widget itemOfArticle(Article article, int index) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(index.toString()),
                      SizedBox(width: 10),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(article.urlToImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(article.source.name, style: TextStyle(fontSize: 20))
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      Text(article.title),
                      Divider(),
                      Text(article.description),
                      Divider(),
                      Text(article.content),
                    ],
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
