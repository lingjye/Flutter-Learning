import 'package:flutter/material.dart';
import 'package:flutter_qq_bridge/flutter_qq_bridge.dart';

const androidAppId = '';
const iOSAppId = '';

class QQLoginSampleApp extends StatelessWidget {
  const QQLoginSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QQLoginSampleAppPage(),
    );
  }
}

class QQLoginSampleAppPage extends StatefulWidget {
  QQLoginSampleAppPage({Key key}) : super(key: key);

  _QQLoginSampleAppPageState createState() => _QQLoginSampleAppPageState();
}

class _QQLoginSampleAppPageState extends State<QQLoginSampleAppPage> {

  var _tencent;
  var _loginRes;
  var _qqUser;
  var _userInfo;
  var _shareQqRes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    configParams();
  }

  configParams() async {
    await FlutterQqBridge.registerQq(androidAppId, iOSAppId);
  }

  qqlogin() async {
    var res = await FlutterQqBridge.login();
    if (res.code == 0) {
      // 成功
      _tencent = Tencent.fromJson(res.message);
      
      // 更新
      setState(() {
        _loginRes = 'oepnId:${_tencent.openId}, accessToken:${_tencent.accessToken}';
        print(_loginRes);
      });
    } else {
      // 失败
    }
  }

  getUserInfo() async {
    if (_tencent != null) { // _tencent from login success
      var res = await FlutterQqBridge.getUserInfo(_tencent);
      if (res.code == 0) {
        _qqUser = QqUser.fromJson(res.message);
        
        // update UI
        setState(() {
          _userInfo = 'nickname:${_qqUser.nickname}, '
              'gender:${_qqUser.gender}, '
              'year:${_qqUser.year}, '
              'province:${_qqUser.province}, '
              'city:${_qqUser.city}, '
              'figureurl:${_qqUser.figureurl},';
          });
        }
    }
  }

  shareToFriends() async {
    // shareToQQ, shareToQzone
    var res = await FlutterQqBridge.shareToQQ(ShareQqContent(
      title: '分享标题',
      summary: '分享内容',
      targetUrl: 'http://a.app.qq.com/o/simple.jsp?pkgname=com.haisong.remeet',
      imageUrl: 'http://pp.myapp.com/ma_icon/0/icon_52621236_1517135649/96',
      appName: '应用名称',
    ));

    // update UI
    setState(() {
      _shareQqRes = 'share -> code: ${res.code}, message:${res.message}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('QQLogin'),
       ),
       body: Center(
         child: Column(
           children: <Widget>[
            RaisedButton(
              child: Text('QQ登录'),
              onPressed: qqlogin,
            ),
            RaisedButton(
              child: Text('获取用户信息'),
              onPressed: getUserInfo,
            ),
            RaisedButton(
              child: Text('分享'),
              onPressed: shareToFriends,
            )
           ],
         ),
       ),
    );
  }
}