import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

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

        // f1 先执行
    // Future(() => print('f1'));
    // Future(() => print('f2'));

    // // f2 执行后 立刻同步执行then 3
    // Future(() => print('f3')).then((_) => print('then 3'));

    // // then 4 会加入微任务队列， 尽快执行
    // Future(() => null).then((_) => print('then 4')).then((_) => print('then 5'));

    
    Future(() => print('f1'));// 声明一个匿名 Future
    Future fx = Future(() =>  null);// 声明 Future fx，其执行体为 null

    // 声明一个匿名 Future，并注册了两个 then。在第一个 then 回调里启动了一个微任务
    Future(() => print('f2')).then((_) {
      print('f3');
      scheduleMicrotask(() => print('f4'));
    }).then((_) => print('f5'));

    // 声明了一个匿名 Future，并注册了两个 then。第一个 then 是一个 Future
    Future(() => print('f6'))
      .then((_) => Future(() => print('f7')))
      .then((_) => print('f8'));

    // 声明了一个匿名 Future
    Future(() => print('f9'));

    // 往执行体为 null 的 fx 注册了了一个 then
    fx.then((_) => print('f10'));

    // 启动一个微任务 微任务队列优先级最高
    scheduleMicrotask(() => print('f11'));
    print('f12');

    delay();
  }

  Future delay() {
    Future.delayed(Duration(milliseconds: 2000)).then((_) {
      print('延时2s后执行');
    });

    Timer(Duration(milliseconds: 2000), () {
      print('22222');
    });
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
    // 方式一 HttpClient
    HttpClient client = HttpClient();
    // 超时时间 20s
    client.idleTimeout = Duration(seconds: 20);
    // 构建uri
    Uri uri = Uri.parse(dataUrl);
    HttpClientRequest request = await client.getUrl(uri);
    // request.headers.add('user-agent', 'Custom-UA');
    // 发起请求 可以使用 then来拼接
    HttpClientResponse response = await request.close();
    if (response.statusCode == HttpStatus.ok) {
      var data = await response.transform(utf8.decoder).join();
      setState(() {
        widgets = json.decode(data);
        print('result=$widgets');
      });
    } 

    // 方式二 http
    /* 
    http.Response response = await http.get(dataUrl);
    setState(() {
      widgets = json.decode(response.body);
      print('result=$widgets');
    });
    */
  }
}

