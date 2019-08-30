import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationWidgetSampleApp extends StatelessWidget {
  const AnimationWidgetSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationWidgetSampleAppHomePage(),
    );
  }
}

class AnimationWidgetSampleAppHomePage extends StatefulWidget {
  AnimationWidgetSampleAppHomePage({Key key}) : super(key: key);

  _AnimationWidgetSampleAppHomePageState createState() => _AnimationWidgetSampleAppHomePageState();
}

class _AnimationWidgetSampleAppHomePageState extends State<AnimationWidgetSampleAppHomePage>  with SingleTickerProviderStateMixin {

  Animation<double> animation ;
  AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween(begin: 50.0, end: 200.0).animate(controller);
    controller.forward();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Animation Widget'),
       ),
       body: Center(
        //  child: Text('Animatiom'),
        child: Container(
          child: AnimationLogo(animation: animation,),
        ),
       ),
       floatingActionButton: FloatingActionButton(
         child: Text('animation'),
         onPressed: (){
           if (animation.status == AnimationStatus.completed) {
             controller.reverse();
           } else if (animation.status == AnimationStatus.dismissed) {
             controller.forward();
           }
         },
       ),
    );
  }
}

class AnimationLogo extends AnimatedWidget {
  // AnimatedWidget 需要在初始化的时候传入 animation 对象
  AnimationLogo({
    Key key,
    Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        height: animation.value, // 获取动画的属性
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}