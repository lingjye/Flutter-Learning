import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TouchListenerSampleApp extends StatelessWidget {
  const TouchListenerSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: TouchListenerSampleAppHomePage(),
    );
  }
}

class TouchListenerSampleAppHomePage extends StatefulWidget {
  TouchListenerSampleAppHomePage({Key key}) : super(key: key);

  _TouchListenerSampleAppHomePageState createState() => _TouchListenerSampleAppHomePageState();
}

class _TouchListenerSampleAppHomePageState extends State<TouchListenerSampleAppHomePage> {

  listenerWidget() {
    return Listener(
      child: Container(
        width: 300,
        height: 300,
        color: Colors.red,
      ),
      onPointerDown: (PointerDownEvent event) {
        print('$event');
      },
      onPointerMove: (event) {
        print('$event');
      },
      onPointerUp: (event) {
        print('$event');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Touch Event Listener'),
       ),
       body: listenerWidget(),
    );
  }
}