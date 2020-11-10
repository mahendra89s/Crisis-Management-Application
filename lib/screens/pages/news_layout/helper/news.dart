import 'package:http/http.dart' as http;
import 'package:calmity/screens/pages/news_layout/models/article.dart';
import 'dart:convert';

//import 'package:news_app_api/secret.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    var response = await http.get(
      ("https://newscatcher.p.rapidapi.com/v1/search?q=farmers&media=True&sort_by=relevancy&lang=en&country=in"),
      headers: {
        "x-rapidapi-host": "newscatcher.p.rapidapi.com",
        "x-rapidapi-key": "1a993d0ba5msh124a041e64b17c1p19e740jsnf8eb9cd674c1"
      },
    );

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        Article article = Article(
          title: element['title'],
          author: element['author'],
          description: element['summary'],
          //urlToImage: element['link'],
          publshedAt: DateTime.parse(element['published_date']),
          content: element["summary"],
          articleUrl: element["link"],
        );
        news.add(article);
      });
    }
  }
}

class NewsForCategorie {
  List<Article> news = [];
  String apiKey = 'bcf32904d0ef469aae92217d154af909';
  Future<void> getNewsForCategory(String category) async {
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    var response = await http.get(
      ("https://newscatcher.p.rapidapi.com/v1/search?q=$category&media=True&sort_by=relevancy&lang=en&country=in"),
      headers: {
        "x-rapidapi-host": "newscatcher.p.rapidapi.com",
        "x-rapidapi-key": "1a993d0ba5msh124a041e64b17c1p19e740jsnf8eb9cd674c1"
      },
    );

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        Article article = Article(
          title: element['title'],
          author: element['author'],
          description: element['summary'],
          //urlToImage: element['link'],
          publshedAt: DateTime.parse(element['published_date']),
          content: element["summary"],
          articleUrl: element["link"],
        );
        news.add(article);
      });
    }
  }
}
