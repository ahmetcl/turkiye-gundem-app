import 'package:flutter/material.dart';
import 'package:haberler_app/view/home_page.dart';

void main() {
  runApp(MyApp());
}

//gite ekli projedir
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haberler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home_page(
        title: 'Türkiye Gündemi',
        key: null,
      ),
    );
  }
}
