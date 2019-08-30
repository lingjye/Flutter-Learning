// 数据传递
import 'package:flutter/material.dart';
import 'package:helloworld/data_noti/dart_event_bus.dart';
import 'package:helloworld/data_noti/dart_noti.dart';

class InHeritedSampleApp extends StatelessWidget {
  const InHeritedSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InHeritedSampleAppHomePage(),
    );
  }
}

class InHeritedSampleAppHomePage extends StatefulWidget {
  InHeritedSampleAppHomePage({Key key}) : super(key: key);

  _InHeritedSampleAppHomePageState createState() => _InHeritedSampleAppHomePageState();
}

class _InHeritedSampleAppHomePageState extends State<InHeritedSampleAppHomePage> {
  int count = 0;
  void _incrementCounter() {
    setState(() {
      count++;
    });
  }
  counterWidget() {
    return CounterWidget(
      // count: 0,
      model: this,
      increment: _incrementCounter,
      child: Counter(),
    );
  }

  pushNotiPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NotiSamplePage()
      )
    );
  }

  pushEventbusPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EventBusSamplePage()
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('数据传递'),
      ),
      body: Column(
        children: <Widget>[
          counterWidget(),
          RaisedButton(child: Text('noti'), onPressed: pushNotiPage,),
          RaisedButton(child: Text('event_bus'), onPressed: pushEventbusPage,)
        ],
      ), 
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _incrementCounter,
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterWidget state = CounterWidget.of(context);
    return Container(
      child: Text('You have pushed the button this many times ${state.model.count}'),
    );
  }
}

// InheritedWidget 
class CounterWidget extends InheritedWidget {
  // 方便子widget在widget树中找到它
  static CounterWidget of(BuildContext context) => context.inheritFromWidgetOfExactType(CounterWidget) as CounterWidget;
  // final int count;
  final Function() increment;
  final _InHeritedSampleAppHomePageState model;

  CounterWidget({
    Key key,
    // @required this.count,
    @required this.model,
    @required this.increment,
    @required Widget child,
  }) : super(key: key, child: child);

  // 判断是否需要更新
  @override
  bool updateShouldNotify(CounterWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return model.count != oldWidget.model.count;
  }
}
