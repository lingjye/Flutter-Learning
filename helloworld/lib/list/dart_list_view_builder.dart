import 'package:flutter/material.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getWidgets();
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
       body: ListView.builder(
         itemCount: widgets.length,
         itemBuilder: (BuildContext context, int position) {
           return getRow(position);
         }
       ),
    );
  }
}