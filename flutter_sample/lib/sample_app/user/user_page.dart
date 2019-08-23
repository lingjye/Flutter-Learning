import '../user/update_page.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人中心'),
      ),
       body: Center(
         child: RaisedButton(
           child: Text('更新页'),
           onPressed: () {
             Navigator.pushNamed(context, '/update_page');
           },
         ),
       ),
    );
  }
}