import 'package:flutter/material.dart';

class ColumnSampleApp extends StatelessWidget {
  const ColumnSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ColumnSampleAppPage(),
    );
  }
}

class ColumnSampleAppPage extends StatelessWidget {
  const ColumnSampleAppPage({Key key}) : super(key: key);

  getChildren1() {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.red,
          height: 100,
          width: 100,
        ),
        Expanded(
          // 自动填充
          child: Container(
            color: Colors.blue,
            width: 100,
          ),
        ),
        Container(
          color: Colors.red,
          height: 100,
          width: 100,
        )
      ],
    );
  }

  getChildren2() {
    return Column(
      children: <Widget>[
        Text('We move under cover and we move as one'),
        Text('Through the night, we have one shot to live another day'),
        Text('We cannot let a stray gunshot give us away'),
        Text('We will fight up close, seize the moment and stay in it'),
        Text('It’s either that or meet the business end of a bayonetIt’s either that or meet the business end of a bayonet'),
        Text('The code word is ‘Rochambeau,’ dig me?'),
      ],
      // 左对齐
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column'),
      ),
      body: getChildren2(),
    );
  }
}