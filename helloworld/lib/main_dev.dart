import 'package:flutter/material.dart';
import 'package:helloworld/debug_develop/config.dart';
import 'package:helloworld/widget/theme_demo.dart';
import 'package:flutter/rendering.dart';

void main() {
  var configuredApp = AppConfig(
    appName: 'dev', // 主页标题
    apiBaseUrl: 'http://dev.example.com',
    child: MyApp(),
  );
  runApp(configuredApp);// 启动

}