import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioSampleApp extends StatelessWidget {
  const DioSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: DioSampleAppPage(),
    );
  }
}

class DioSampleAppPage extends StatelessWidget {
  const DioSampleAppPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void loadData() async {
      try {
        Response response = await Dio().get('http://www.baidu.com', queryParameters: {});
        print(response);
        Response postRes = await Dio().post('http://www.baidu.com', data: {}, queryParameters: {});
        print(postRes);
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      body: Center(
        child: RaisedButton(
          textColor: Colors.red,
          child: Text('Request'),
          onPressed: loadData,
        ),
      ),
    );
  }
}