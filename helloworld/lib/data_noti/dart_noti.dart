import 'package:flutter/material.dart';

class NotiSamplePage extends StatefulWidget {
  NotiSamplePage({Key key}) : super(key: key);

  _NotiSamplePageState createState() => _NotiSamplePageState();
}

class _NotiSamplePageState extends State<NotiSamplePage> {
  String _notiMsg = '通知：';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Container(
        color: Colors.yellow,
        child: NotificationListener(
          child: Column(
            children: <Widget>[
              Text(_notiMsg),
              CustomChild()
            ],
          ),
          onNotification: (noti) {
            // print('$noti');
            // print('${noti.msg}');
            setState(() {
              _notiMsg += noti.msg + '';
            });
            
          },
        ),
      ),
    );
  }
}

class CustomNotification extends Notification {
  CustomNotification(this.msg);
  final String msg;
}

class CustomChild extends StatelessWidget {
  const CustomChild({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('发送通知'),
      onPressed: () => CustomNotification('通知内容').dispatch(context),
    );
  }
}