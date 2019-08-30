import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:event_bus/event_bus.dart';

// 第三放插件 需要引入 event_bus 库

// 建立公共的 event bus
EventBus eventBus = EventBus(); 

class CustomEvent {
  String msg;
  CustomEvent(this.msg);
}

class EventBusSamplePage extends StatefulWidget {
  EventBusSamplePage({Key key}) : super(key: key);

  _EventBusSamplePageState createState() => _EventBusSamplePageState();
}

class _EventBusSamplePageState extends State<EventBusSamplePage> {
  String _notiMsg = '通知：';
  StreamSubscription subscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = eventBus.on<CustomEvent>().listen((event) {
      setState(() {
        _notiMsg += event.msg;
      });
    });
  }

  @override
  void dispose() { 
    subscription.cancel(); //state 销毁时， 清理注册时间 避免内存泄露
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EventBus'),
      ),
      body: Container(
        color: Colors.yellow,
        child: Text(_notiMsg),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('push'),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EventBusSecondPage()
          )
        ),
      ),
    );
  }
}

class EventBusSecondPage extends StatelessWidget {
  const EventBusSecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Two'),
      ),
      body: RaisedButton(
        child: Text('发送消息'),
        onPressed: () => eventBus.fire(CustomEvent('Hello')),
      ),
    );
  }
}