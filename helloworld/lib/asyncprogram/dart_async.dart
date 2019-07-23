import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AsyncSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: AsyncSampleAppHomePage(),
    );
  }
}

class AsyncSampleAppHomePage extends StatefulWidget {
  AsyncSampleAppHomePage({Key key}) : super(key: key);

  _AsyncSampleAppHomePageState createState() => _AsyncSampleAppHomePageState();
}

class _AsyncSampleAppHomePageState extends State<AsyncSampleAppHomePage> {
  List widgets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('异步'),        
      ),
      // 创建一个ListView
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position){
          return getRow(position);
        },
      ),
    );
  }
  // 返回一个列表子元素，类似UITableViewCell
  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text('Row ${widgets[i]["title"]}'),
    );
  }
  // 网络请求，异步
  void loadData() async {
    String dataUrl = 'https://jsonplaceholder.typicode.com/posts';
    http.Response response = await http.get(dataUrl);
    setState(() {
      widgets = json.decode(response.body);
      print('result=$widgets');
    });
  }
}

