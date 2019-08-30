import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelSample extends StatelessWidget {
  const MethodChannelSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MethodChannelSampleHomePage(),
    );
  }
}

class MethodChannelSampleHomePage extends StatefulWidget {
  MethodChannelSampleHomePage({Key key}) : super(key: key);

  _MethodChannelSampleHomePageState createState() => _MethodChannelSampleHomePageState();
}

const platform = MethodChannel('samples.demo/test');

class _MethodChannelSampleHomePageState extends State<MethodChannelSampleHomePage> {

  @override
  void initState() { 
    super.initState();
    platform.setMethodCallHandler((MethodCall call) async {
      print(call.method);
      print(call.arguments);
    });
  }

  handleButtonClick() async {
    var result;
    try {
      //异步等待方法通道的调用结果
      result = await platform.invokeMethod('openAppMarket', {'params':"value"});
      
    } catch (e) {
      print(e);
      result = -1;
    }
    print('result: $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('打开应用商店'),
       ),
       body: Center(
         child: Column(
           children: <Widget>[
             RaisedButton(
               child: Icon(Icons.pan_tool),
               onPressed: () {
                 handleButtonClick();
               },
             )
           ],
         ),
       ),
    );
  }

  
}