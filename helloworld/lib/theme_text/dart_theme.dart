import 'package:flutter/material.dart';

class MaterialSampleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // 设置主题色是蓝色
        primarySwatch: Colors.blue,
        // 设置文字选中时为红色
        textSelectionColor: Colors.red,
      ),
      home: MaterialSampleAppPage(),
    );
  }
}

class MaterialSampleAppPage extends StatelessWidget {
  const MaterialSampleAppPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: Center(
        // child: Text(
        //   '自定义字体 Custom Font',
        //   style: TextStyle(fontFamily: 'your font family', fontSize: 20),
        // ),
        child: Icon(
          // 使用iconfont
          IconData(
            0xea74,
            fontFamily:'iconfont',
          ),
          color: Colors.red,
          size: 100,
        )
      ),
    );
  }
}