import 'package:flutter/services.dart';
import 'dart:core';

typedef Future<dynamic> EventHandler(String event);

//Flutter Push 插件
class FlutterPushPlugin  {
  // 单例
  static final FlutterPushPlugin _instance = new FlutterPushPlugin.private(const MethodChannel('flutter_push_plugin'));
  // 方法通道
  final MethodChannel _channel;
  // 消息回调
  EventHandler _onOpenNotification;
  // 构造方法
  FlutterPushPlugin.private(MethodChannel channel) : _channel = channel {
    // 注册原生反向回调方法，让原生代码宿主可以执行 onOpenNotification 方法
    _channel.setMethodCallHandler(_handleMethod);
  }
  // 初始化极光 SDK
  setupWithAppID(String appID) {
    _channel.invokeMethod("setup", appID);
  }
  // 注册消息通知
  setOpenNotificationHandler(EventHandler onOpenNotification) {
    _onOpenNotification = onOpenNotification;
  }

  // 注册原生反向回调方法，让原生代码宿主可以执行 onOpenNotification 方法
  Future<Null> _handleMethod(MethodCall call) {
    switch (call.method) {
      case "onOpenNotification":
        return _onOpenNotification(call.arguments);
      default:
        throw new UnsupportedError("Unrecognized Event");
    }
  }
  // 获取地址 id
  Future<String> get registrationID async {
    final String regID = await _channel.invokeMethod('getRegistrationID');
    return regID;
  }
}
