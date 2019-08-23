import 'package:flutter/material.dart';

class PaddingSampleApp extends StatelessWidget {
  const PaddingSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: PaddingSampleAppPage(),
    );
  }
}

class PaddingSampleAppPage extends StatelessWidget {
  const PaddingSampleAppPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Text('Padding 是一个单Widget容器'),
      ),
    );
  }
}