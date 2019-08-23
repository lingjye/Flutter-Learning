import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandedSampleApp extends StatelessWidget {
  const ExpandedSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExpandedSampleAppPage(),
    );
  }
}

class ExpandedSampleAppPage extends StatefulWidget {
  ExpandedSampleAppPage({Key key}) : super(key: key);

  _ExpandedSampleAppPageState createState() => _ExpandedSampleAppPageState();
}

class _ExpandedSampleAppPageState extends State<ExpandedSampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Expanded'),
       ),
       body: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 间距相等
         mainAxisSize: MainAxisSize.min, //让容器宽度与子widge保持一致，此时对齐方式失效
         children: <Widget>[
          //  Expanded(
          //    flex: 1,
          //    child: Container(
          //      color: Colors.cyan,
          //      height: 80,
          //    ),
          //  ),
           Container(
             color: Colors.blue,
             width: 100,
             height: 100,
           ),
           Container(
             color: Colors.green,
             width: 100,
             height: 50,
           ),
           Container(
             color: Colors.red,
             width: 100,
             height: 200,
           ),
          //  Expanded(
          //    flex: 1,
          //    child: Container(
          //      color: Colors.yellow,
          //      height: 100,
          //    ),
          //  )
         ],
       ),
    );
  }
}