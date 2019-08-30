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
        '/d': (BuildContext context) => NavigationSampleAppPage(title: 'page four'),
      },
    );
  }
}

class NavigationSampleAppPage extends StatefulWidget {
  final String title;
  NavigationSampleAppPage({Key key, this.title}) : super(key: key);

  _NavigationSampleAppPageState createState() => _NavigationSampleAppPageState();
}

class _NavigationSampleAppPageState extends State<NavigationSampleAppPage> {

  _NavigationSampleAppPageState();

  Future _push() async {
    var result;
    if (widget.title.contains('Home')) {
      Navigator.of(context).pushNamed('/b', arguments: 'Hey');
    } else if (widget.title.contains('two')) {
      // 带返回值，方式一
      Navigator.of(context).pushNamed('/c').then((data){
        print('then=$data');
      });
      // 带返回值方式二
      // result = await Navigator.of(context).pushNamed('/c');
    } else if (widget.title.contains('three')) {
      // 返回page one
      // Navigator.of(context).popUntil(ModalRoute.withName('/b'));
      // 带返回值
      // Navigator.of(context).pop({'key': 'value'});
      // 自定义Routes
      Navigator.push(context, PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __){
          return NavigationSampleAppPage(title: 'page four');//Center(child: Text('My Page Route'));
        },
        transitionsBuilder: (___, Animation<double> animation, ____, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: RotationTransition(
              // 旋转动画参数
              turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: child,
            ),
          );
        }
      ));
    } else if (widget.title.contains('four')) {
       Navigator.of(context).popUntil(ModalRoute.withName('/b'));
    }
    print('result = $result');
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String msg = ModalRoute.of(context).settings.arguments as String;
    print('$msg');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
