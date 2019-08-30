import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileManageSample extends StatelessWidget {
  const FileManageSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FileManageSampleHomePage(),
    );
  }
}

class FileManageSampleHomePage extends StatefulWidget {
  FileManageSampleHomePage({Key key}) : super(key: key);

  _FileManageSampleHomePageState createState() => _FileManageSampleHomePageState();
}

class _FileManageSampleHomePageState extends State<FileManageSampleHomePage> {
  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/content.txt');
  }

  Future<File> writeContent(String content) async {
    final file = await _localFile;
    return file.writeAsString(content);
  }

  Future<String> readContent() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('文件管理'),
       ),
       body: Center(
         child: Column(
           children: <Widget>[
             RaisedButton(
               child: Text('创建目录'),
               onPressed:  () {
                 print(_localFile);
               },
             ),
             RaisedButton(
               child: Text('写'),
               onPressed: () {
                 print(writeContent('Hello world!'));
               },
             ),
             RaisedButton(
               child: Text('读'),
               onPressed: () {
                 readContent().then((value) => print(value));
               },
             )
           ],
         ),
       ),
    );
  }
}