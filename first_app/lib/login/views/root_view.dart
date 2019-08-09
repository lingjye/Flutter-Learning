import 'package:flutter/material.dart';
import 'package:persist_theme/persist_theme.dart';
import 'package:local_auth/local_auth.dart';
import 'package:first_app/login/models/auth.dart';

class LoginSampleApp extends StatefulWidget {
  LoginSampleApp({Key key}) : super(key: key);

  _LoginSampleAppState createState() => _LoginSampleAppState();
}

class _LoginSampleAppState extends State<LoginSampleApp> {
  final ThemeModel _model = ThemeModel();
  final AuthModel _auth = AuthModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try {
      ——au
    } catch (e) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
         primarySwatch: Colors.blue
       ),
       home: LoginSampleAppHomePage(),
    );
  }
}

class LoginSampleAppHomePage extends StatefulWidget {
  LoginSampleAppHomePage({Key key}) : super(key: key);

  _LoginSampleAppHomePageState createState() => _LoginSampleAppHomePageState();
}

class _LoginSampleAppHomePageState extends State<LoginSampleAppHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Text('Login'),
    );
  }
}