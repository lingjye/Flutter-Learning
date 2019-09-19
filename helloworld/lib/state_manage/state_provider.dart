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

class ProviderSamplePage extends StatelessWidget {
  const ProviderSamplePage({Key key}) : super(key: key);
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
    // final _counter = Provider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Consumer<Counter>(
          builder: (context, counter, _) {
            return Text('Counter:${counter.counter}');
          },
        )
      ),
      floatingActionButton: Consumer<Counter>(
        builder: (context, counter, child) {
          return FloatingActionButton(
            onPressed: counter.increment,
            child: child //Icon(Icons.add),
          );
        },
        child: TestIcon(),
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

class TestIcon extends StatelessWidget {
  const TestIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('TestIcon build');
    return Icon(Icons.add);
  }
}