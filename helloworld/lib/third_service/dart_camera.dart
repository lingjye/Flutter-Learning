import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraSampleApp extends StatelessWidget {
  const CameraSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CameraSampleAppPage(),
    );
  }
}

class CameraSampleAppPage extends StatefulWidget {
  CameraSampleAppPage({Key key}) : super(key: key);

  _CameraSampleAppPageState createState() => _CameraSampleAppPageState();
}

class _CameraSampleAppPageState extends State<CameraSampleAppPage> {
  File _image;

  Future getImage() async {
    // 可以指定为camera
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  _getChild() {
    return _image == null ? Text('No Image Selected') : Image.file(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Image Picker Example'),
       ),
       body: Center(
         child: _getChild(),
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: getImage,
         tooltip: 'Pick Image',
         child: Icon(Icons.add),
       ),
    );
  }
}