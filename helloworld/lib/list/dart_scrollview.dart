import 'package:flutter/material.dart';

class ScrollViewSampleApp extends StatelessWidget {
  const ScrollViewSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ScrollViewSampleAppPage(),
    );
  }
}

class ScrollViewSampleAppPage extends StatefulWidget {
  ScrollViewSampleAppPage({Key key}) : super(key: key);

  _ScrollViewSampleAppPageState createState() => _ScrollViewSampleAppPageState();
}

class _ScrollViewSampleAppPageState extends State<ScrollViewSampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('ScrollView'),
       ),
       body: ListView(
         padding: EdgeInsets.only(left: 20, top: 20),
         children: <Widget>[
           Text('Row One'),
           Text('Row Two'),
           Text('Row Three'),
           Text('Row Four'),
           Text('Row Five')
         ],
       ),
    );
  }
}