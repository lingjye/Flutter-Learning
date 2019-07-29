import 'package:flutter/material.dart';

class StackSampleApp extends StatelessWidget {
  const StackSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: StackSampleAppPage(),
    );
  }
}

class StackSampleAppPage extends StatelessWidget {
  const StackSampleAppPage({Key key}) : super(key: key);

  getStack1() {
    return Stack(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          color: Colors.blue,
        ),
        Container(
          width: 90,
          height: 90,
          color: Colors.yellow,
        ),
        Container(
          width: 80,
          height: 80,
          color: Colors.red,
        ),
      ],
      alignment: Alignment.topRight,
    );
  }

  getStack2() {
    return SizedBox(
      width: 250,
      height: 250,
      child: Stack(
        children: <Widget>[
          Container(
            width: 250,
            height: 250,
            color: Colors.yellow,
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withAlpha(0),
                  Colors.black12,
                  Colors.black45
                ],
              ),
            ),
            child: Text(
              'Foreground Text',
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
          )
        ],
      ),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: getStack2(),
    );
  }
}