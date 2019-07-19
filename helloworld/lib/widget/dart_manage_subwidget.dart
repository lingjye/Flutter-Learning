import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubWidgetSampleApp extends StatelessWidget {
  const SubWidgetSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: SubWidgetSampleAppPage(),
    );
  }
}

class SubWidgetSampleAppPage extends StatefulWidget {
  SubWidgetSampleAppPage({Key key}) : super(key: key);

  _SubWidgetSampleAppPageState createState() => _SubWidgetSampleAppPageState();
}

class _SubWidgetSampleAppPageState extends State<SubWidgetSampleAppPage> {

  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
      return CupertinoButton(
        onPressed: (){},
        child: Text('Toggle Two'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SubWidget Sample App'),
        ),
        body: Center(
          child: _getToggleChild(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggle,
          tooltip: 'Update Text',
          child: Icon(Icons.update),
        ),
    );
  }
}