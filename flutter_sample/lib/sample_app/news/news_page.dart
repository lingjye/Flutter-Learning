import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资讯'),
      ),
       body: Card(
         child: Text('data'),
       ),
    );
  }
}