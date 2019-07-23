import 'dart:convert';
import 'dart:isolate';

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
  }

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

  Future sendReceive(SendPort port, msg) {
    ReceivePort response = ReceivePort();
    port.send([msg, response.sendPort]);
    return response.first;
  }
}