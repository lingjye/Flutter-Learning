import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class GridViewBuilderSampleApp extends StatelessWidget {
  const GridViewBuilderSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: GridViewBuilderSampleAppPage(),
    );
  }
}

class GridViewBuilderSampleAppPage extends StatefulWidget {
  GridViewBuilderSampleAppPage({Key key}) : super(key: key);

  _GridViewBuilderSampleAppPageState createState() => _GridViewBuilderSampleAppPageState();
}

class _GridViewBuilderSampleAppPageState extends State<GridViewBuilderSampleAppPage> {
  List<Widget> widgets = [];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDatas();
  }

  getDatas() {
    Future.delayed(Duration(milliseconds:2000)).then((e) {
      setState(() {
        for (var i = 0; i < 20; i++) {
          widgets.add(getItem(i));
        }
      });
    });
  }

  getItem(int i) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: 10,
          height: 10,
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(
            color: Colors.red[100],
            border: Border.all(
              width: 5.0,
              color: Colors.yellow
            ),
            boxShadow: [BoxShadow(
              color: Colors.red,
              blurRadius: 20
            )],
          ),
          child: Text('Item index $i', style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline, decorationColor: Colors.red)),
        )
      ),
      onTap: () {
        print('Tap item at index: $i');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('GridView'),
       ),
       body: GridView.builder(
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 3, // 三列
           childAspectRatio: 1.0 //宽高相等
         ),
         itemCount: widgets.length,
         itemBuilder: (context, index) {
           if (index == widgets.length - 1) {
             getDatas();
           }
           return getItem(index);
         },
       ),
    );
  }
}
