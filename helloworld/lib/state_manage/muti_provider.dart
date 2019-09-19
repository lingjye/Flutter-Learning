import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MutiProviderSample extends StatelessWidget {
  const MutiProviderSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(
          value: 20.0, // 注入字体大小
        ),
        ChangeNotifierProvider.value(value: Counter(),) // 注入计数实例
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MutiProviderSamplePage(),
      ),
    );
  }
}

class MutiProviderSamplePage extends StatelessWidget {
  const MutiProviderSamplePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final _counter = Provider.of<Counter>(context);
    // final size = Provider.of<double>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('多状态'),
      ),
      body: Consumer2<Counter, double>(
        builder: (context, counter, size, _) {
          return Center(
            child: Text('Size=$size, Counter=${counter.counter}', style: TextStyle(fontSize: size),),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.skip_next),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScondPage())),
      ),
    );
  }
}

class ScondPage extends StatelessWidget {
  const ScondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _counter = Provider.of<Counter>(context);
    // final size = Provider.of<double>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Second'),
      ),
      body: Center(
        child: Consumer2<Counter, double>(
          builder: (context, counter, size, _) {
            return Text('Size:$size, Count: ${counter.counter}', style: TextStyle(fontSize: size),);
          },
        )
      ),
      floatingActionButton: Consumer2<Counter, double>(
        builder: (context, counter, size, child) {
          return FloatingActionButton(
            child: child,
            onPressed: () => counter.increment(),
          );
        },
        child: Icon(Icons.add),
      )
    );
  }
}

class Counter with ChangeNotifier {
  int _count = 0;
  int get counter => _count;
  void increment() {
    _count++;
    // 通知监听者刷新
    notifyListeners();
  }
}