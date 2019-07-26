import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GridViewSampleApp extends StatelessWidget {
  const GridViewSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: GridViewSampleAppPage(),
    );
  }
}

class GridViewSampleAppPage extends StatefulWidget {
  GridViewSampleAppPage({Key key}) : super(key: key);

  _GridViewSampleAppPageState createState() => _GridViewSampleAppPageState();
}

class _GridViewSampleAppPageState extends State<GridViewSampleAppPage> {
  List<Widget> widgets = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widgets.addAll([
      Icon(Icons.add),
           Icon(Icons.update),
           Icon(Icons.edit),
           Icon(Icons.favorite),
           Icon(Icons.face),
           FlutterLogo(style: FlutterLogoStyle.horizontal,),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('GridView'),
       ),
       /*
       body: GridView(
        //  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //    crossAxisCount: 3,      //纵轴子元素数量
        //    mainAxisSpacing: 10.0,  // 主轴方向子元素间距
        //    crossAxisSpacing: 10.0, // 纵轴方向子元素的间距
        //    childAspectRatio: 1.0   // 宽度与高度的比例，例如：1.0代表宽高相等，2.0代表高度为宽度的一半，依次类推
        //  ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 150,  // 最大长度
          mainAxisSpacing: 10.0,    // 主轴间距
          crossAxisSpacing: 10.0,   // 纵轴子元素间距
          childAspectRatio: 1.0,    // 纵轴与主轴长度比
        ),
         children: widgets,
       ),
       */
      /*
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        children: widgets,
      ),
      */
      body: GridView.extent(
        maxCrossAxisExtent: 150,
        childAspectRatio: 1.0,
        children: widgets,
      ),
    );
  }
}