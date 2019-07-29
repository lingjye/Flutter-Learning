import 'package:flutter/material.dart';
import 'dart:math';

class TransformSampleApp extends StatelessWidget {
  const TransformSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: TransformSampleAppPage(),
    );
  }
}

class TransformSampleAppPage extends StatefulWidget {
  TransformSampleAppPage({Key key}) : super(key: key);

  _TransformSampleAppPageState createState() => _TransformSampleAppPageState();
}

class _TransformSampleAppPageState extends State<TransformSampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Scaffold'),
       ),
       body: Container(
         color: Colors.black,
         child: Transform(
           alignment: Alignment.topLeft,
           transform: Matrix4.skewY(0.3)..rotateZ(-pi / 12.0),
           child: Container(
             padding: const EdgeInsets.all(50.0),
             margin: const EdgeInsets.all(50),
             color: Colors.red[100],
             child: const Text('Apartment for rent!'),
           ),
         ),
       ),
    );
  }
}