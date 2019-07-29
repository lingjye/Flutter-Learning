import 'package:flutter/material.dart';

class WrapSampleApp extends StatelessWidget {
  const WrapSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: WrapSampleAppPage(),
    );
  }
}
class WrapSampleAppPage extends StatefulWidget {
  WrapSampleAppPage({Key key}) : super(key: key);

  _WrapSampleAppPageState createState() => _WrapSampleAppPageState();
}

class _WrapSampleAppPageState extends State<WrapSampleAppPage> {

  getWrap() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 10.0,
      children: <Widget>[
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            child: Text('A'),
          ),
          label: Text('AAA'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            child: Text('B'),
          ),
          label: Text('BBB'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            child: Text('C'),
          ),
          label: Text('CCC'),
        ),
        Chip(
          avatar: CircleAvatar(
            backgroundColor: Colors.blue.shade900,
            child: Text('D'),
          ),
          label: Text('DDD'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Wrap'),
       ),
       body: getWrap(),
    );
  }
}