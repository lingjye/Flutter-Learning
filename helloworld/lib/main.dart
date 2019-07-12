import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// void main() {
//   runApp(
//     new Center(child: new Text(
//         'Hello world',
//         textDirection: TextDirection.ltr,
//       ),
//     ),

//   );
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final appName = 'Custom Themes';
    return MaterialApp(
      title: appName,
      theme:  new ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.yellow,
        primaryColor: Colors.red
      ),
      home: new MyHomePage(
        title: appName
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Container(
          color: Theme.of(context).accentColor,
          child: new Text(
            title
          ),
        ),
      ),
      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.yellow),
        child: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.add),
        ),
        
      ),
    );
  }
}
