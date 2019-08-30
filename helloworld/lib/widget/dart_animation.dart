import 'package:flutter/material.dart';

class AnimationSampleApp extends StatelessWidget {
  const AnimationSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimationSampleAppPage(title: 'Fade Demo'),
    );
  }
}

class AnimationSampleAppPage extends StatefulWidget {
  AnimationSampleAppPage({Key key, this.title}) : super(key: key);

  final String title;

  _AnimationSampleAppPageState createState() => _AnimationSampleAppPageState();
}

class _AnimationSampleAppPageState extends State<AnimationSampleAppPage> with SingleTickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curveAnimation;
  Animation<double> animation;
  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
    
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this, // 绑定到需要显示到的widget上
      
    );
    curveAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut,
    );
    // curveAnimation.addListener(() {
      // value 0 - 1 透明度
      // print('动画监听${controller.value}');
    // });
    curveAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 执行完毕
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 反向执行完毕
        controller.forward();
      }
    }); 
    
    // 创建从 50 到 200 跟随振荡曲线变化的 Animation 对象
    animation = Tween(begin: 50.0, end: 200.0).animate(curveAnimation)..addListener(() {
      setState(() {
        
      });
    }) ;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
       ),
       body: Center(
         child: Container(
           width: animation.value,
           height: animation.value,
          // child: FlutterLogo(),
          //  child: FadeTransition(
          //    opacity: curveAnimation,
             child: FlutterLogo(
              //  size: 100.0,
             ),
          //  ),
         ),
       ),
       floatingActionButton: FloatingActionButton(
         tooltip: 'Fade',
         child: Icon(Icons.update),
         onPressed: (){
           controller.forward();
          // controller.repeat();
         },
       ),
    );
  }
}

