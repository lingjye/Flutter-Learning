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
       body: Container(
         // 主题复用
         color: Theme.of(context).primaryColor,
         child: Text(
           'Text with a background color',
           // 使用主题色
          //  style: TextStyle(color: Theme.of(context).primaryColor),
            style: Theme.of(context).textTheme.title,
          ),
       ),
    );
  }
}