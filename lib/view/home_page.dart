import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/news_service_dart.dart';
import '../models/article.dart';

class home_page extends StatefulWidget {
  home_page({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _home_page createState() => _home_page();
}

class _home_page extends State<home_page> {
  List<Articles> articles = [];

  @override
  void initState() {
    NewsService.getNews().then((value) {
      setState(() {
        articles = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 23, 153, 1),
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'RussoOne',
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(articles[index].urlToImage ??
                          'https://i0.wp.com/designermenus.com.au/wp-content/uploads/2016/02/icon-None.png?w=300&ssl=1'),
                      ListTile(
                        leading: Icon(Icons.arrow_drop_down_circle),
                        title: Text(articles[index].title ?? ''),
                        subtitle: Text(articles[index].author ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(articles[index].description ?? ''),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          MaterialButton(
                              onPressed: () async {
                                await launch(articles[index].url ?? '');
                              },
                              child: Text('Habere Git')),
                        ],
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
