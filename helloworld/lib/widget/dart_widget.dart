import 'package:flutter/material.dart';


class SampleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // StatelessWidget
    // return Text(
    //     'Hello world',
    //     textDirection: TextDirection.ltr,
    //     style: TextStyle(
    //       fontWeight: FontWeight.bold,
    //       fontSize: 100
    //  ),
    // );
    // StatefullWidget
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
  
}

class SampleAppPage extends StatefulWidget {
   SampleAppPage({ Key key }) : super(key: key);

   @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SampleAppPageState();
  }
}

class _SampleAppPageState extends State<SampleAppPage> {
  // 默认占位文字
  String text = 'I like Flutter';
  
  void _updateText() {
    setState(() {
      text = 'Flutter is Awesome!';
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample App'),
      ),
      body: Center(
        child: Text(text),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Update Text',
        child: Icon(Icons.update),
      ),
    );
  }
}