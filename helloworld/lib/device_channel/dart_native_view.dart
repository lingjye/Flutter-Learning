import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SampleNativeViewSample extends StatelessWidget {
  const SampleNativeViewSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: SampleNativeViewSampleHomePage(),
    );
  }
}

class SampleNativeViewSampleHomePage extends StatefulWidget {
  SampleNativeViewSampleHomePage({Key key}) : super(key: key);

  _SampleNativeViewSampleHomePageState createState() => _SampleNativeViewSampleHomePageState();
}

class _SampleNativeViewSampleHomePageState extends State<SampleNativeViewSampleHomePage> {
  NativeViewController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = NativeViewController();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('NativeView'),
       ),
       body: Container(
         child: SampleView(controller: controller,),
         width: 200,
         height: 200,
         margin: EdgeInsets.fromLTRB(100, 100, 0, 0),
       ),
       backgroundColor: Colors.yellow,
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.color_lens),
         onPressed: () {
           controller.changeBackgroundColor();
         },
       ),
    );
  }
}

// class SampleView extends StatelessWidget {
//   const SampleView({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     if (defaultTargetPlatform == TargetPlatform.android) {
//       return AndroidView(viewType: 'sampleView',);
//     } else {
//       return UiKitView(viewType: 'sampleView',);
//     }
//   }
// }

class SampleView extends StatefulWidget {
  SampleView({Key key, this.controller}) : super(key: key);
  // 持有视图控制器
  final NativeViewController controller;

  _SampleViewState createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'sampleView',
        // 原生视图创建完成后，通过onPlatformViewController产生回调
        onPlatformViewCreated: _onPlatformViewCreate,
      );
    } else {
      return UiKitView(
        viewType: 'sampleView',
        onPlatformViewCreated: _onPlatformViewCreate,
      );
    }
  }

  _onPlatformViewCreate(int id) {
    if (widget.controller == null) {
      return;
    }
    widget.controller.onCreate(id);
  }
}


class NativeViewController {
  MethodChannel _channel;
  // 原生视图创建完成后，通过id生成唯一方法通道
  onCreate(int id) {
    _channel = MethodChannel('sample.demo/native_views_$id');
  }
  // 调用原生视图方法，改变背景颜色
 changeBackgroundColor() async {
   try {
    var result = await _channel.invokeMethod('changeBackgroundColor');
    print(result);
   } catch (e) {
     print(e);
   }
    
  }
}