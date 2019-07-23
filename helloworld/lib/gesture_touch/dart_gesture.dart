import 'package:flutter/material.dart';


class GestureSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      // home: GestureSampleAppGesturePage(),
      // home: GestureSampleAppButtonPage(),
      home: DoubleTapAnimation(),
    );
  }
}

// 本身包含事件监测
class GestureSampleAppButtonPage extends StatelessWidget {
  const GestureSampleAppButtonPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势与触摸事件'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: (){
            print('click');
          },
          child: Text('Button'),
          color: Colors.red,
        ),
      )
    );
  }
}

// 不包含事件监测
class GestureSampleAppGesturePage extends StatelessWidget {
  const GestureSampleAppGesturePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手势与触摸事件'),
      ),
      body: Center(
        child: GestureDetector(
          child: FlutterLogo(
            size: 200.0,
          ),
          onTap: () {
            print("tap");
          },
        ),
      )
    );
  }
}

// 双击旋转图标，结合动画
class DoubleTapAnimation extends StatefulWidget {
  DoubleTapAnimation({Key key}) : super(key: key);

  _DoubleTapAnimationState createState() => _DoubleTapAnimationState();
}

class _DoubleTapAnimationState extends State<DoubleTapAnimation> with TickerProviderStateMixin {

  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Double Tap'),
      ),
      body: Center(
        child: GestureDetector(
          child: RotationTransition(
            child: FlutterLogo(
              size: 200,
            ),
            turns: curve,
          ),
          
          onDoubleTap: () {
            if (controller.isCompleted) {
              controller.reverse();
            } else {
              controller.forward();
            }
            print('double tap');
          },
        ),
      ),
    );
  }
}
