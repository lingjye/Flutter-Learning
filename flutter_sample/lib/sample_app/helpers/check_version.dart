import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:native_widgets/native_widgets.dart';

class CheckVersion {

  bool _checkVersionLowerOf(String version) {
    return true;
  }

  Future<Map> _getAppLocalInfo() async {
    final directory = {
      'version': '1.0.1',
      'url': ''
    };
    return directory;
  }

  // 下载
  Future<void> _executeDownload(_appPath) async {
    final taskId = await FlutterDownloader.enqueue(
      url: _appPath + '/app-release.apk',
      savedDir: _appPath,
      showNotification: true,
      openFileFromNotification: true
    );
    FlutterDownloader.registerCallback((id, status, progress) {
      if (taskId == id && status == DownloadTaskStatus.complete) {
        _installApk(_appPath);
      }
    });
  }

  Future<Null> _installApk(_appPath) async {
    // 本地资源访问
    // 参数为项目名称
    const platform = const MethodChannel('first_app');
    try {
      await platform.invokeMethod('install', {'path': _appPath});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  void checkAndUpdate(BuildContext context) {
    _getAppLocalInfo().then((directory) {
      String _version = directory['version'];
      //比较服务器版本与当前版本
      if (_checkVersionLowerOf(_version)) {
        String _appPath = directory['url'];
        // 弹出alert
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('提示'), 
              content: Text('发现新版本'), 
              actions: <Widget>[
                CupertinoButton(
                  child: Text('取消'),
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                ),
                CupertinoButton(
                  child: Text('确定'),
                  onPressed: () {
                    if (_appPath.length <= 1) return;
                    _executeDownload(_appPath);
                    Navigator.maybePop(context);
                  },
                )
              ],
            );
          }
        );
      }
    });
  }

}