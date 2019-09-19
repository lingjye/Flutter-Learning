import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef Future<dynamic> ItemSelectCallback(index);

class OrientationBuilderSample extends StatelessWidget {
  const OrientationBuilderSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: OrientationBuilderSamplePage(),
    );
  }

  getReleaseModel() {
    if (kReleaseMode) {
      print('True');
    } else {
      print('False');
    }
  }
}

class OrientationBuilderSamplePage extends StatefulWidget {
  OrientationBuilderSamplePage({Key key}) : super(key: key);

  _OrientationBuilderSamplePageState createState() => _OrientationBuilderSamplePageState();
}

class _OrientationBuilderSamplePageState extends State<OrientationBuilderSamplePage> {
  var selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('旋转'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          // 还可以使用MediaQuery来获取当前状态
          print(MediaQuery.of(context).orientation);
          print(orientation);
          // 根据屏幕旋转方向返回不同布局行为
          return orientation == Orientation.portrait ? _buildVerticalLayout(context) : _buildHorizontalLayout();
        },
      ),
    );
  }

  _buildVerticalLayout(context) {
    
    // return Center(
    //     child: Text('竖屏'),
    // );
    return ListWidget(onItemSelected: (index) {
      print('$index');
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailWidget(data: index,)));
    },);
  }

  _buildHorizontalLayout() {
    // 强制竖屏
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // return Center(
      // child: Text('横屏'),
    // );
    return Row(
      children: <Widget>[
        Expanded(
          child: ListWidget(onItemSelected: (index) {
            print('$index');
            setState(() {
              selectIndex = index;
            });
          },
          ),
        ),
        Expanded(
          child: DetailWidget(data:selectIndex),
        )
      ],
    );
  }
}

class ListWidget extends StatefulWidget {
  final ItemSelectCallback onItemSelected;
  ListWidget({Key key, this.onItemSelected}) : super(key: key);

  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('$index'),
          onTap: () => widget.onItemSelected(index),
        );
      },
    );
  }
}

class DetailWidget extends StatefulWidget {
  final int data;
  DetailWidget({Key key, this.data}) : super(key: key);

  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).orientation == Orientation.portrait ? AppBar(
        title: Text('detail'),
      ) : null,
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Text('${widget.data}', style: TextStyle(fontSize: 30),),
        )
      ),
    );
  }
}