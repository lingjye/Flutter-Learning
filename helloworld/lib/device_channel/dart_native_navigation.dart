import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeNavigationSample extends StatelessWidget {
  const NativeNavigationSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: NativeNavigationSamplePage(),
    );
  }
}

class NativeNavigationSamplePage extends StatefulWidget {
  NativeNavigationSamplePage({Key key}) : super(key: key);

  _NativeNavigationSamplePageState createState() => _NativeNavigationSamplePageState();
}

class _NativeNavigationSamplePageState extends State<NativeNavigationSamplePage> {

  var platform = MethodChannel('samples.flutter/navigation');

  openNativePage() {
    var result = platform.invokeMethod('openNativePage');
    print(result);
  }

  closeFlutterPage() {
    var result = platform.invokeMethod('closeFlutterPage');
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('混合开发'),
         leading: RaisedButton(
           child: Icon(Icons.arrow_back_ios, color: Colors.white,),
           onPressed: closeFlutterPage,
           color: Colors.blue,
         ),
       ),
       body: Column(
         children: <Widget>[
           RaisedButton(
             child: Text('native'),
             onPressed: openNativePage
           ),
           RaisedButton(
             child: Text('Close'),
             onPressed: closeFlutterPage,
           )
         ],
       ),
    );
  }
}