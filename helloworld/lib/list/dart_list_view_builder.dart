import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListViewBuilderSampleApp extends StatelessWidget {
  const ListViewBuilderSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: ListViewBuilderSampleAppPage(),
    );
  }
}

class ListViewBuilderSampleAppPage extends StatefulWidget {
  ListViewBuilderSampleAppPage({Key key}) : super(key: key);

  _ListViewBuilderSampleAppPageState createState() => _ListViewBuilderSampleAppPageState();
}

class _ListViewBuilderSampleAppPageState extends State<ListViewBuilderSampleAppPage> {
  List widgets = [];
  ScrollController _scrollController;
  bool _isTop = false;// 默认不需要展示
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getWidgets();
    _scrollController = ScrollController();
    _scrollController.addListener((){
      // 滑动监听
      // print('${_scrollController.offset}');
      if (_scrollController.offset >= 300.0) {
        if (_isTop) return;
        setState(() {
          _isTop = true;
        });
      } else {
        if (!_isTop) return;
        setState(() {
          _isTop = false;
        });
      }
    });
  }

  _getWidgets() {
    for (var i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
  }

  getRow(int i) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text('row at inde: $i'),
      ),
      onTap: () {
        setState(() {
          widgets.add(
            getRow(widgets.length + 1)
          );
          print('tap row at $i');
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('ListView Builder'),
       ),
       body:  NotificationListener<ScrollNotification>(
         child: ListView.builder(
          itemCount: widgets.length,
          itemExtent: 70.0, // 列表项高度,
          itemBuilder: (BuildContext context, int position) {
            return getRow(position);
          },
          // scrollDirection: Axis.horizontal, // 改变滑动方向
          controller: _scrollController,
          // cacheExtent: 2, // 提前加载区域
        ),
        onNotification: (noti) {
          // print('$noti');
          print('${noti.metrics.pixels}');
          if (noti is ScrollStartNotification) {
            print('Start');
          } else if (noti is ScrollUpdateNotification) {
            print('Update');
          } else if (noti is ScrollEndNotification) {
            print('End');
            return true;
          }
        },
       ),
       floatingActionButton: _isTop ? FloatingActionButton(
         child: Icon(Icons.publish),
         onPressed: () {
           _scrollController.animateTo(
             0.0,
             duration: Duration(microseconds: 300),
             curve: Curves.ease
           );
         },
       ) : null,
       floatingActionButtonLocation: FloatButtonOffSet(),
    );
  }

  @override
  void dispose() {
    _scrollController = null;
    // TODO: implement dispose
    super.dispose();
  }
}

// 修改floatActionButton位置
class FloatButtonOffSet extends FloatingActionButtonLocation {
  const FloatButtonOffSet();
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // TODO: implement getOffset
    return Offset(scaffoldGeometry.scaffoldSize.width - 100, scaffoldGeometry.scaffoldSize.height - 150);
  }
}