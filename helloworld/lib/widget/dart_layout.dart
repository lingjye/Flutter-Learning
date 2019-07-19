import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutSampleApp extends StatelessWidget {
  const LayoutSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutSampleAppPage(),
    );
  }
}

class LayoutSampleAppPage extends StatefulWidget {
  LayoutSampleAppPage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LayoutSampelAppSate();
  }
}

class _LayoutSampelAppSate extends State<LayoutSampleAppPage> {
  var _pressedCount = 0;
  void _updateState() {
    setState(() {
      _pressedCount += 1;
      print(_pressedCount);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Layout App'),
        ),
        body: Center(
          child: CupertinoButton(
            onPressed: _updateState,
            child: Text(_pressedCount.toString()),
            padding: EdgeInsets.only(left: 40.0, right: 10),
            color: Colors.red,
          ),
        ),
      );
  }
}