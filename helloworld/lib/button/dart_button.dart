import 'package:flutter/material.dart';

class ButtonSampleApp extends StatelessWidget {
  const ButtonSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ButtonSampleAppPage(),
    );
  }
}

class ButtonSampleAppPage extends StatefulWidget {
  ButtonSampleAppPage({Key key}) : super(key: key);

  _ButtonSampleAppPageState createState() => _ButtonSampleAppPageState();
}

class _ButtonSampleAppPageState extends State<ButtonSampleAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('button'),
       ),
       body: Column(
         children: <Widget>[
           FloatingActionButton(
             child: Icon(Icons.pages),
             onPressed: () {
               print('object');
             },
           ),
           FlatButton(
             child: Row(
               children:[
                 Icon(Icons.add),
                 Text('Add')
               ],
               
             ),
             color: Colors.yellow,// 默认是透明的
             shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
             colorBrightness: Brightness.light, // 默认light
             onPressed: () {
               print('object');
             },
           ),
           RaisedButton(
             child: Icon(Icons.panorama),
             onPressed: () {
               print('object');
             },
           )
         ],
       ),
    );
  }
}