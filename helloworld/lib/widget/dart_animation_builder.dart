import 'package:flutter/material.dart';
import 'package:helloworld/widget/dart_animation.dart';

class AnimationBuilderSample extends StatelessWidget {
  const AnimationBuilderSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AnimationSampleAppHomePage()
    );
  }
}

class AnimationSampleAppHomePage extends StatefulWidget {
  AnimationSampleAppHomePage({Key key}) : super(key: key);

  _AnimationSampleAppHomePageState createState() => _AnimationSampleAppHomePageState();
}

class _AnimationSampleAppHomePageState extends State<AnimationSampleAppHomePage> with TickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() { 
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween(begin: 50.0, end: 200.0).animate(controller);
    controller.forward();
    
  }

  animationBuilder() {
    return AnimatedBuilder(
      animation: animation,
      child: FlutterLogo(),
      builder: (BuildContext context, Widget child) {
        return Container(
          width: animation.value,
          height: animation.value,
          child: child,
        );
      },
    );
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       appBar: AppBar(
         title: Text('AnimationBuilder'),
       ),
       body: Center(
         child: animationBuilder(),
       ),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.directions_run),
         onPressed: () {
           if (animation.status == AnimationStatus.completed) {
             controller.reverse();
           } else if (animation.status == AnimationStatus.dismissed) {
             controller.forward();
           }
         }
       ),
    );
  }
}