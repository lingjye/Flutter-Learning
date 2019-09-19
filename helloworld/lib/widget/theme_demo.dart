import 'package:flutter/material.dart';
import 'package:helloworld/debug_develop/config.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // final appName = 'Custom Themes';
    var config = AppConfig.of(context);// 获取配置信息
    var appName = config.appName;
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
            // title
            AppConfig.of(context).apiBaseUrl
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
