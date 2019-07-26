import 'package:flutter/material.dart';

class ContainerSampleApp extends StatelessWidget {
  const ContainerSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ContainerSampleAppPage(),
    );
  }
}

class ContainerSampleAppPage extends StatelessWidget {
  const ContainerSampleAppPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Center(
        // 示例一
        // child: Container(
        //   margin: EdgeInsets.all(20.0), // 与父widget的边距为20
        //   color: Colors.amber[600],
        //   width: 500,// 当宽度超过屏幕宽度，看到的效果实际上是与屏幕保持20的边距
        //   height: 500,
        // ),
        // 示例二
        child: Container(
          constraints: BoxConstraints.expand(
            height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200,
          ),
          padding: const EdgeInsets.all(8.0),
          // color: Colors.blue,
          alignment: Alignment.center,
          child: Text('Hello world', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white),),
          // transform: Matrix4.rotationZ(0.1),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
              width: 5.0
            ),
            color: Colors.red[100],
          ),
        ),
      ),
    );
  }
}
