import 'package:flutter/material.dart';

class FormSampleApp extends StatelessWidget {
  const FormSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      // home: FormSampleAppPage(),
      home: _FormSampleAppPage(),
    );
  }
}

class FormSampleAppPage extends StatefulWidget {
  FormSampleAppPage({Key key}) : super(key: key);

  _FormSampleAppPageState createState() => _FormSampleAppPageState();
}

class _FormSampleAppPageState extends State<FormSampleAppPage> {
  // 创建表单
  final formController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(
           title: Text('表单输入'),
         ),
         body: Padding(
           padding: const EdgeInsets.all(16.0),
           child: TextField(
             controller: formController,
             style: TextStyle(
               color: Colors.red
             ),
             decoration: InputDecoration(
               hintText: '请输入文字',
              ),
           ),
         ),
         floatingActionButton: FloatingActionButton(
           // 用户点击时显示
           onPressed: () {
             return showDialog(
               context: context,
               builder: (context) {
                 return AlertDialog(
                   title: Text('输入内容'),
                   content: Text(formController.text),
                  );
               }
             );
           },
           tooltip: '点击',
           child: Icon(Icons.text_fields),
         ),
       ),
    );
  }
}

// 错误提示
class _FormSampleAppPage extends StatefulWidget {
  _FormSampleAppPage({Key key}) : super(key: key);

  __FormSampleAppPageState createState() => __FormSampleAppPageState();
}

class __FormSampleAppPageState extends State<_FormSampleAppPage> {
  String _errorText;
  
  void showError(text) {
    setState(() {
      if (!isEmail(text)) {
        _errorText = 'Error, This is not email.';
      } else {
        _errorText = null;
      }
    });
  }

  bool isEmail(text) {
    // 正则匹配
    String emailRegexp = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailRegexp);
    return regExp.hasMatch(text);
  }

  _getErrorText() {
    print(_errorText);
    return _errorText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('表单'),
       ),
       body: Center(
         child: TextField(
           onSubmitted: (String text) {
             showError(text);
             print('提交');
           },
           decoration: InputDecoration(
             hintText: '请输入一个email',
             errorText: _getErrorText()
           ),
         ),
       ),
    );
  }
}