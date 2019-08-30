import 'package:flutter/material.dart';

class HeroAnimationSample extends StatelessWidget {
  const HeroAnimationSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HeroAnimationSampleHomePage(),
    );
  }
}

class HeroAnimationSampleHomePage extends StatefulWidget {
  HeroAnimationSampleHomePage({Key key}) : super(key: key);

  _HeroAnimationSampleHomePageState createState() => _HeroAnimationSampleHomePageState();
}

class _HeroAnimationSampleHomePageState extends State<HeroAnimationSampleHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Hero Animation'),
       ),
       body: Center(
         child: Listener(
           onPointerDown: (event) {
             Navigator.of(context).push(
               MaterialPageRoute(
                 builder: (_) => SecondPage()
               )
             );
           },
           child: Hero(
             tag: 'hero',
             child: FlutterLogo(
              size: 200,
            ),
           ),
         )
       ),
    );
  }
}

class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Second Page'),
       ),
       body: Center(
         child: Listener(
           onPointerDown: (_) => Navigator.of(context).pop(),
           child: Hero(
            tag: 'hero',
            child: FlutterLogo(
                size: 300,
            ),
          ),
         ),
       ),
    );
  }
}
