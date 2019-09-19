import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    @required this.appName,
    @required this.apiBaseUrl,
    @required Widget child
  }) : super(child: child);
  final String appName;
  final String apiBaseUrl; // rootURL

  // 方便其子 Widget 在Widget树中找到它
  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  // 判断是否需要子 Widget 更新。由于是应用入口，无需更新
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return false;
  }
}