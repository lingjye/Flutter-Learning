import 'package:flutter/material.dart';

class LifeCycleApp extends StatelessWidget {
  const LifeCycleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LifeCycleAppPage(),
    );
  }
}

class LifeCycleAppPage extends StatefulWidget {
  LifeCycleAppPage({Key key}) : super(key: key);

  _LifeCycleAppPageState createState() => _LifeCycleAppPageState();
}

class _LifeCycleAppPageState extends State<LifeCycleAppPage> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init');  

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_){
      print("单次 Frame 绘制回调");//只回调一次
    });

    WidgetsBinding.instance.addPersistentFrameCallback((_){
      print(" 实时 Frame 绘制回调 ");// 每帧都回调
    });

  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(LifeCycleAppPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('Deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('LifeCycle'),
       ),
       body: Center(
         child: Text('data'),
       ),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.pages),
         onPressed: () {
           Navigator.of(context).push(
             MaterialPageRoute(
               builder: (context) {
                 return Scaffold(
                   appBar: AppBar(
                     title: Text('page2'),
                   ),
                   body: Center(
                     child: Text('data'),
                   ),
                 );
               }
             )
           );
         },
       ),
    );
  }

  // APP生命周期回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print("$state");
  }
}