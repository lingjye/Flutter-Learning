// 多个target 响应单一gesture
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MultiGestureSampleApp extends StatelessWidget {
  const MultiGestureSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MultiGestureSampleAppHomePage(),
    );
  }
}

class MultiGestureSampleAppHomePage extends StatefulWidget {
  MultiGestureSampleAppHomePage({Key key}) : super(key: key);

  _MultiGestureSampleAppHomePageState createState() => _MultiGestureSampleAppHomePageState();
}

class _MultiGestureSampleAppHomePageState extends State<MultiGestureSampleAppHomePage> {
  
  // 红色Container坐标
  double _top = 0.0;
  double _left = 0.0;
  gestureWidget() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: Container(
              color: Colors.red,
              width: 200,
              height: 200,
            ),
            onTap: () => print('tap') ,
            onLongPress: () => print('Long Press'),
            onDoubleTap: () => print('Double Tao'),
            onPanUpdate: (e) {
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
          ),
        ),
      ],
    );
  }

  // rawGestureDetector 父容器响应子容器点击事件
  rawGestureDetector() {
    return RawGestureDetector( // 自己构造父widget的手势识别映射关系
      gestures: {
        // 建立多手势识别器与手势识别工厂类的映射关系，从而返回可以响应手势的 recognizer
        MultipleTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<
        MultipleTapGestureRecognizer>(
          () => MultipleTapGestureRecognizer(), 
          (MultipleTapGestureRecognizer instance) {
            instance.onTap = () => print('parent tapped'); // 点击回调
          }
        ),
      },
      child: Container(
        color: Colors.pinkAccent,
        child: Center(
          child: GestureDetector(
            child: Container(
              // width: 100,
              color: Colors.green,
            ),
            onTap: () => print('Child Tapped'),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Multi Gesture'),
       ),
      //  body: gestureWidget(),
      body: rawGestureDetector(),
    );
  }
}

class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  // 父容器监听子容器的点击事件 多个Widget 监听一个手势
  @override
  void rejectGesture(int pointer) {
    // TODO: implement rejectGesture
    // super.rejectGesture(pointer);
    // 父容器与子容器手势同时响应
    acceptGesture(pointer);
  }

  // @override
  // void acceptGesture(int pointer) {
  //   // TODO: implement acceptGesture
  //   super.acceptGesture(pointer);
  // }
}