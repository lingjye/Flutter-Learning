import 'dart:convert';
import 'dart:isolate';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class IsolateSampleApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IsolateSampleAppPage(),
    );
  }
}

class IsolateSampleAppPage extends StatefulWidget {
  IsolateSampleAppPage({Key key}) : super(key: key);

  _IsolateSampleAppPageState createState() => _IsolateSampleAppPageState();
}

class _IsolateSampleAppPageState extends State<IsolateSampleAppPage> {
  List widgets = [];
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();

    // Isolate Test
    Isolate.spawn(isolateTest, 'Isolate');

    startSend();

    Future(() => print('f1'))
    .then((_) async => Future.microtask(() => print('f2')))
    .then((_) => print('f3'));
    Future(() => print('f4'));

  }

  isolateTest(msg) => print(msg);
  
  Isolate isolate;

  startSend() async {
    ReceivePort receivePort = ReceivePort(); // 创建管道
    // 创建并发 Isolate， 并传入发送管道
    isolate = await Isolate.spawn(getMsg, receivePort.sendPort);
    // 监听管道信息
    receivePort.listen((data) {
      print('Data: $data');
      receivePort.close(); // 关闭管道
      isolate?.kill(priority: Isolate.immediate); // 杀死并发 Isolate
      isolate = null;
    });
  }

  getMsg(sendPort) => sendPort.send('Hello');



  //------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isolate'),
        backgroundColor: Colors.blue,
      ),
      body: getBody(),
    );
  }
  // 是否显示dialog
  showLoadingDialog() {
    return loading;
  }

  // 显示内容时loading View还是listView
  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    }
    return getListView();
  }

  getProgressDialog() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget getListView() {
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      },
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(widgets[i]['title']),
    );
  }

  loadData() async {
    ReceivePort receivePort = ReceivePort();
    await Isolate.spawn(dataLoader, receivePort.sendPort);
    // The 'echo' isolate sends its SendPort as the first message
    SendPort sendPort = await receivePort.first;

    List msg = await sendReceive(sendPort, 'https://jsonplaceholder.typicode.com/posts');

    setState(() {
      widgets = msg;
      loading = false;
    });
  }

  // 进入Isolate
  static dataLoader(SendPort sendPort) async {
    // 打开接收消息端口
    ReceivePort port = ReceivePort();
    // 通知Isolate
    sendPort.send(port.sendPort);

    await for (var msg in port) {
      String data = msg[0];
      SendPort replyTo = msg[1];

      String dataUrl = data;
      http.Response response = await http.get(dataUrl);
      replyTo.send(json.decode(response.body));
    }
  }

  Future sendReceive(SendPort port, msg) async {
    ReceivePort response = ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
}