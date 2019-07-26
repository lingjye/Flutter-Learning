import 'package:flutter/material.dart';

class AlignSampleApp extends StatelessWidget {
  const AlignSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: AlignSampleAppPage(),
    );
  }
}

class AlignSampleAppPage extends StatelessWidget {
  const AlignSampleAppPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align'),
      ),
      body: Center(
        child: Container(
          height: 120.0,
          width: 80.0,
          color: Colors.blue[50],
          child: Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ),
      ),
    );
  }
}