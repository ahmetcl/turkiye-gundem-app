import 'dart:convert';

import 'package:haberler_app/models/article.dart';
import 'package:haberler_app/models/news.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static NewsService _singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService() {
    return _singleton;
  }

  static Future<List<Articles>> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=cead6459dd7c4a408f598e5298e138e2';

    final response = await http.get(url);

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}
