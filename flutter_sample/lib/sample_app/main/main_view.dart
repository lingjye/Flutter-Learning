import 'package:flutter_sample/sample_app/home/home_page.dart';

import '../helpers/life_cycle_observer.dart';
import '../helpers/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './main_page_view.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

final ThemeData kIOSTheme = ThemeData(
  // 主题色 Colore
  primaryColor: Color.fromRGBO(152, 202, 83, 1),
  // statubar style
  primaryColorBrightness: Brightness.dark,
  // 前景色 黑色
  accentColor: Colors.red,
  // 是否暗黑模式
  // brightness: Brightness.dark,
  // icon图标主题 所有icon都为黄色
  iconTheme: IconThemeData(color: Colors.yellow),
  // 文字主题 文本颜色为绿色
  textTheme: TextTheme(body1: TextStyle(color: Colors.green))
);

final ThemeData kAndroidTheme = ThemeData(
  // 主题色 Color
  primaryColor: Color.fromRGBO(152, 202, 83, 1),
  // statubar style
  // primaryColorBrightness: Brightness.light,
  // 前景色 黑色
  accentColor: Colors.red,
  // 是否暗黑模式
  brightness: Brightness.dark,
  // icon图标主题 所有icon都为黄色
  iconTheme: IconThemeData(color: Colors.yellow),
  // 文字主题 文本颜色为绿色
  textTheme: TextTheme(body1: TextStyle(color: Colors.green))
);

class MySampleApp extends StatelessWidget {
  const MySampleApp({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    LifeCycleObserver.instance.startObserver();

    return MaterialApp(
      theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kAndroidTheme,
      // theme: kIOSTheme,
      home:  MySampleAppMainPage(),
      routes: Router.routes, 
      onUnknownRoute: (RouteSettings setting) => MaterialPageRoute(builder: (context) => SampleUnknownRoutePage())
    );
  }
}

class SampleUnknownRoutePage extends StatelessWidget {
  const SampleUnknownRoutePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final PageRouteBuilder _homeRoute = PageRouteBuilder(
    //   pageBuilder: (BuildContext context, _, __) {
    //     return MySampleAppMainPage();
    //   }, 
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text('页面不存在'),
      ),
      body: Center(
        heightFactor: 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.error, size: 200,),
            RaisedButton(
              child: Text('返回上页'),
              onPressed:() {
                Navigator.of(context).pop();
              }
            ),
          ],
        ),
      )
    );
  }
}




