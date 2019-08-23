import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PositionedSampleApp extends StatelessWidget {
  const PositionedSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: PositionedSampleAppPage(),
    );
  }
}

class PositionedSampleAppPage extends StatelessWidget {
  const PositionedSampleAppPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Positioned'),
      ),
      body: Stack(
        alignment: AlignmentGeometry.lerp(Alignment.topRight, Alignment.topRight, 1),
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
          Positioned(
            child: Container(
              color: Colors.green,
              width: 80,
              height: 150,
            ),
            left: 0,
            top: 18,
          ),
          Container(
            color: Colors.yellow,
            width: 70,
            height: 200,
          ),
          Positioned(
            child: Text('Positioned设置left，top, widht,height,...等属性后，显示的大小会根据其他容器改变, 父容器Stack会裁剪超出区域, 只能用在Stack中'),
            // left: 10,
            // top: 10,
            // width: 200,
          )
          
        ],
      ),
    );
  }
}