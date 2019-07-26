import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomScrollViewSampleApp extends StatelessWidget {
  const CustomScrollViewSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: CustomScrollViewSampleAppPage(),
    );
  }
}

class CustomScrollViewSampleAppPage extends StatefulWidget {
  CustomScrollViewSampleAppPage({Key key}) : super(key: key);

  _CustomScrollViewSampleAppPageState createState() => _CustomScrollViewSampleAppPageState();
}

class _CustomScrollViewSampleAppPageState extends State<CustomScrollViewSampleAppPage> {

  customScrollView1() {
    return CustomScrollView(
         // 相当于iOS中的bunces属性，当设置为true时，未超过屏幕高度，不能滚动
         shrinkWrap: false,
         slivers: <Widget>[
           SliverPadding(
             padding: EdgeInsets.all(10),
             sliver: SliverList(
               delegate: SliverChildListDelegate(<Widget>[
                 Text('first line'),
                 Text('Second line'),
                 Text('Third line'),
                 Text('Fourth line'),
                 Text('Fifth line'),
                 Text('Sixth line'),
               ]),
             ),
           )
         ],
       );
  }

  customScrollView2() {
    return CustomScrollView(
      shrinkWrap: false,
      slivers: <Widget>[
        // 包含一个导航栏
        SliverAppBar(
          // true 时，标题悬浮，类似于iOS中的largeTitle效果
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('CustomScrollView'),
            background: FlutterLogo(),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:3, 
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.0,
            ),
            delegate: SliverChildBuilderDelegate((BuildContext context, int position) {
              return Container(
                alignment: Alignment.center,
                color: Colors.red[100 * (position % 9) + 100],
                child: Text('Grid item atIndex $position', style: TextStyle(fontSize: 20),),
              );
            }, childCount: 30),
          ),
        ),
        // List
        SliverFixedExtentList(
          itemExtent: 50,
          delegate: SliverChildBuilderDelegate((BuildContext context, int position) {
            // 创建列表
            return Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (position % 9) + 100],
              child: Text('List item atIndex $position', style: TextStyle(fontSize: 20)),
            );
          }, childCount: 30),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Custom ScrollView'),
      // ),
      // body: customScrollView1(),
      body: customScrollView2(),
    );
  }
}