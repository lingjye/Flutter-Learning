import 'package:flutter/material.dart';

class ListViewSampleApp extends StatelessWidget {
  const ListViewSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListViewSampleAppPage(),
    );
  }
}

class ListViewSampleAppPage extends StatefulWidget {
  ListViewSampleAppPage({Key key}) : super(key: key);

  _ListViewSampleAppPageState createState() => _ListViewSampleAppPageState();
}

class _ListViewSampleAppPageState extends State<ListViewSampleAppPage> {

  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widgets = _getListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('List View'),
       ),
       body: ListView(
         children: widgets,
       ),
    );
  }

  List<Widget> _getListData() {
    List<Widget> widgets = [];
    for (int i = 0; i< 100; i++) {
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
    return widgets;
  }
}