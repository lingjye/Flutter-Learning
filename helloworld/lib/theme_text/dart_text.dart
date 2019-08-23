import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextSampleApp extends StatelessWidget {
  const TextSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextSampleAppPage(),
    );
  }
}

class TextSampleAppPage extends StatelessWidget {
  const TextSampleAppPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            child: Text(
              'text paragraph, 这是一段文字，文字测试，文本是视图系统中的常见控件，用来显示一段特定样式的字符串',
              style: TextStyle(
                backgroundColor: Colors.yellow,
                color: Colors.red,
                fontSize: 20,
                shadows: [
                  Shadow(color: Colors.black, offset: Offset(0, 2), blurRadius: 2),
                ]
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            padding: EdgeInsets.only(left: 10, top: 20),
          ),
          Text.rich(
            TextSpan(
              children: <TextSpan> [
                TextSpan(
                  text: '富文本一',
                  style: TextStyle(color: Colors.red, fontSize: 10),
                ),
                TextSpan(
                  text: '富文本二',
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
                TextSpan(
                  text: '富文本三',
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 30
                  )
                )
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}