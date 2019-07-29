import 'package:flutter/material.dart';

class RowSampleApp extends StatelessWidget {
  const RowSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: RowSampleAppPage(),
    );
  }
}

class RowSampleAppPage extends StatelessWidget {
  const RowSampleAppPage({Key key}) : super(key: key);

  getChildren1() {
    return <Widget>[
      FlutterLogo(),
      // 文本过长，其他孩子将无处摆放，报错
      // Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
      Expanded(
        child: Text('Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
      ),

      Icon(Icons.sentiment_very_dissatisfied),
    ];
  }

  getChildren2() {
    return <Widget>[
      Expanded(
        // child: FlutterLogo(),
        child: Text('Hello, Hello, Hello, Welcome'),
      ),
      Expanded(
        child: Text('Hello world', textAlign: TextAlign.center,),
      ),
      Expanded(
        child: Icon(Icons.sentiment_very_dissatisfied),
      ),      
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row'),
      ),
      body: Row(
        children: getChildren2(),
        // crossAxisAlignment: CrossAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.baseline,
        // textBaseline: TextBaseline.ideographic,
        // textDirection: TextDirection.rtl,
      ),
    );
  }
}