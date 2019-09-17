import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderSample extends StatelessWidget {
  const ProviderSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Counter(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: ProviderSamplePage(),
      ),
    );

  }
}

class ProviderSamplePage extends StatefulWidget {
  ProviderSamplePage({Key key}) : super(key: key);

  _ProviderSamplePageState createState() => _ProviderSamplePageState();
}

class _ProviderSamplePageState extends State<ProviderSamplePage> {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<Counter>(context);
    return Scaffold(
       appBar: AppBar(
         title: Text('Provider'),
       ),
       body: Center(
         child: Text('${_counter.counter}'),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage())),
       ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<Counter>(context);
    return Scaffold(
      body: Center(
        child: Text('Counter:${_counter.counter}')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counter.increment,
        child: Icon(Icons.add),
      ),
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