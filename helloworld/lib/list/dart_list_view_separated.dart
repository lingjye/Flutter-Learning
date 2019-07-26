import 'package:flutter/material.dart';

class ListViewSeparatedSampleApp extends StatelessWidget {
  const ListViewSeparatedSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ListViewSeparatedSampleAppPage(),
    );
  }
}

class ListViewSeparatedSampleAppPage extends StatefulWidget {
  ListViewSeparatedSampleAppPage({Key key}) : super(key: key);

  _ListViewSeparatedSampleAppPageState createState() => _ListViewSeparatedSampleAppPageState();
}

class _ListViewSeparatedSampleAppPageState extends State<ListViewSeparatedSampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text('Row at index: $i'),
          ),
          onTap: () {
            print('row tapped');
          },
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('List View SeparatorBuilder'),
       ),
       body: ListView.separated(
         padding: EdgeInsets.only(right: 10),
         itemCount: widgets.length,
         itemBuilder: (BuildContext content, int position) {
           return widgets[position];
         },
         separatorBuilder: (BuildContext context, int position) {
          // 分割线 
          // return Container(height: 0.5, color: Colors.grey[300], );
          // indent 左侧缩进宽度
          return Divider(height: 1.0, indent: 10, color: Colors.grey[300]);
          // 不带child Widget 的装饰容盒子，只使用边框参数
          // return DecoratedBox( decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 0.5),));
         },
       ),
    );
  }
}