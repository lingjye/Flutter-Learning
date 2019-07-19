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

class _AnimationSampleAppPageState extends State<AnimationSampleAppPage> with TickerProviderStateMixin{
  AnimationController controller;
  CurvedAnimation curve;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this
    );
    curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(widget.title),
       ),
       body: Center(
         child: Container(
           child: FadeTransition(
             opacity: curve,
             child: FlutterLogo(
               size: 100.0,
             ),
           ),
         ),
       ),
       floatingActionButton: FloatingActionButton(
         tooltip: 'Fade',
         child: Icon(Icons.update),
         onPressed: (){
           controller.forward();
         },
       ),
    );

    @override
    dispose() {
      controller.dispose();
      super.dispose();
    }
  }
}

