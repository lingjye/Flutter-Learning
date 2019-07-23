import 'package:flutter/material.dart';
import 'package:fake_push/fake_push.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class XGPushSampleApp extends StatelessWidget {
  const XGPushSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: XGPushSampleAppPage(),
    );
  }
}

class XGPushSampleAppPage extends StatefulWidget {
  XGPushSampleAppPage({Key key}) : super(key: key);

  _XGPushSampleAppPageState createState() => _XGPushSampleAppPageState();
}

class _XGPushSampleAppPageState extends State<XGPushSampleAppPage> {
  Push _push = Push();

  StreamSubscription<String> _receiveDeviceToken;
  StreamSubscription<Message> _receiveMessage;
  StreamSubscription<Message> _receiveNotification;
  StreamSubscription<String> _launchNotification;
  StreamSubscription<String> _resumeNotification;

  @override
  void initState() {
    super.initState();
    _receiveDeviceToken =
        _push.receiveDeviceToken().listen(_handleReceiveDeviceToken);
    _receiveMessage = _push.receiveMessage().listen(_handleReceiveMessage);
    _receiveNotification =
        _push.receiveNotification().listen(_handleReceiveNotification);
    _launchNotification =
        _push.launchNotification().listen(_handleLaunchNotification);
    _resumeNotification =
        _push.resumeNotification().listen(_handleResumeNotification);

    _push.startWork(enableDebug: !_isReleaseMode());
    // 第二次打开应用再调用
    SharedPreferences.getInstance().then((SharedPreferences sharedPref) {
      if (sharedPref.getBool('firstStart') ?? true) {
        sharedPref.setBool('firstStart', false);
      } else {
        _push.areNotificationsEnabled().then((bool isEnabled) {
          if (!isEnabled) {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) {
                return CupertinoAlertDialog(
                  title: const Text('提示'),
                  content: const Text('开启通知权限可收到更多优质内容'),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: const Text('取消'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    CupertinoDialogAction(
                      child: const Text('设置'),
                      onPressed: () {
                        _push.openNotificationsSettings();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          }
        });
      }
    });
  }

  void _handleReceiveDeviceToken(String deviceToken) async {
    print('receiveDeviceToken: $deviceToken - ${await _push.getDeviceToken()}');
    _showTips('receiveDeviceToken', deviceToken);
  }

  void _handleReceiveMessage(Message message) {
    print(
        'receiveMessage: ${message.title} - ${message.content} - ${message.customContent}');
    _showTips('receiveMessage',
        '${message.title} - ${message.content} - ${message.customContent}');
  }

  void _handleReceiveNotification(Message notification) {
    print(
        'receiveNotification: ${notification.title} - ${notification.content} - ${notification.customContent}');
    _showTips('receiveNotification',
        '${notification.title} - ${notification.content} - ${notification.customContent}');
  }

  void _handleLaunchNotification(String customContent) {
    print('launchNotification: $customContent');
    _showTips('launchNotification', customContent);
  }

  void _handleResumeNotification(String customContent) {
    print('resumeNotification: $customContent');
    _showTips('resumeNotification', customContent);
  }

  void _showTips(String title, String content) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('朕知道了～'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  bool _isReleaseMode() {
    return const bool.fromEnvironment('dart.vm.product');
  }

  @override
  void dispose() {
    if (_receiveDeviceToken != null) {
      _receiveDeviceToken.cancel();
    }
    if (_receiveMessage != null) {
      _receiveMessage.cancel();
    }
    if (_receiveNotification != null) {
      _receiveNotification.cancel();
    }
    if (_launchNotification != null) {
      _launchNotification.cancel();
    }
    if (_resumeNotification != null) {
      _resumeNotification.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('信鸽推送'),
      ),
      body: Center(
        child: GestureDetector(
          child: Text('${Platform.operatingSystem}'),
          onTap: () {},
        ),
      ),
    );
  }
}