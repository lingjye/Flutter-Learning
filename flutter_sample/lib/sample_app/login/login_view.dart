import 'package:flutter/material.dart';

class LoginViewPage extends StatefulWidget {
  LoginViewPage({Key key}) : super(key: key);

  _LoginViewPageState createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("登录"),
       ),
       body: Text("data"),
    );
  }
}