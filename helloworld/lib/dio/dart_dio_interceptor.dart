import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

Dio dio = Dio();

class DioSample extends StatelessWidget {
  const DioSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(accentColor: Colors.blue),
      home: DioSampleHomePage(),
    );
  }
}

class DioSampleHomePage extends StatefulWidget {
  DioSampleHomePage({Key key}) : super(key: key);

  _DioSampleHomePageState createState() => _DioSampleHomePageState();
}

class _DioSampleHomePageState extends State<DioSampleHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Dio Interceptor'),
       ),
       body: Center(
         child: RaisedButton(
           child: Text('Request'),
           onPressed: request
         ),
       ),
    );
  }

  request() async {
   
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        print(options);
        // 为每个请求添加请求头
        options.headers['user-agent'] = 'Custom-UA';
        if(options.headers['token'] == null) {
          return dio.reject('error: 请先登录');
        }
        // 检查缓存是否有数据
        if (options.uri == Uri.parse('http://api.baidu.com/file')) {
          return dio.resolve('返回缓存数据');
        }
        return options;
      }
    ));

    try {
      var response = await dio.get('http://api.baidu.com/file');
      print(response.data.toString());
    } catch (e) {
      print(e);
    }
  }
}