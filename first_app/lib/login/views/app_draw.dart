import 'package:flutter/material.dart';
import 'package:first_app/login/utils/const.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/login/view_models/auth_view_model.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({Key key}) : super(key: key);

  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    final _auth = ScopedModel.of<AuthViewModel>(context, rebuildOnChange: true);
    return Drawer(
       child: SafeArea(
         child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            ListTile(
              title: Text('退出', textScaleFactor: textScaleFactor,),
              onTap: () {
                _auth.logout();
              },
            ),
          ],
        ),
       ),
    );
  }
}