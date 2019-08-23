import 'package:flutter/material.dart';

class WealthPage extends StatefulWidget {
  WealthPage({Key key}) : super(key: key);

  _WealthPageState createState() => _WealthPageState();
}

class _WealthPageState extends State<WealthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('财富'),
      ),
       body: Card(
         child: Text('data'),
       ),
    );
  }
}