import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Navigation',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: NavigationSampleAppPage(title: 'Home Page',),
      routes: <String, WidgetBuilder> {
        '/a': (BuildContext context) => NavigationSampleAppPage(title: 'Home Page'),
        '/b': (BuildContext context) => NavigationSampleAppPage(title: 'page two'),
        '/c': (BuildContext context) => NavigationSampleAppPage(title: 'page three'),
      },
    );
  }
}

class NavigationSampleAppPage extends StatefulWidget {
  final String title;
  NavigationSampleAppPage({Key key, this.title}) : super(key: key);

  _NavigationSampleAppPageState createState() => _NavigationSampleAppPageState(title);
}

class _NavigationSampleAppPageState extends State<NavigationSampleAppPage> {
  final String title;

  _NavigationSampleAppPageState(this.title);

  Future _push() async {
    var result;
    if (this.title.contains('Home')) {
      Navigator.of(context).pushNamed('/b');
    } else if (this.title.contains('two')) {
      // 带返回值，方式一
      Navigator.of(context).pushNamed('/c').then((data){
        print('then=$data');
      });
      // 带返回值方式二
      // result = await Navigator.of(context).pushNamed('/c');
    } else if (this.title.contains('three')) {
      // 返回page one
      Navigator.of(context).popUntil(ModalRoute.withName('/b'));
      // 带返回值
      // Navigator.of(context).pop({'key': 'value'});
    }
    print('result = $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: _push,
          )
        ],
      ),
    );
  }
}
