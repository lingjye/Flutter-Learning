import 'package:first_app/login/views/app_draw.dart';
import 'package:flutter/material.dart';
import 'package:first_app/login/view_models/auth_view_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/login/utils/const.dart';

class LoginSampleAppHomePage extends StatefulWidget {
  LoginSampleAppHomePage({Key key}) : super(key: key);

  _LoginSampleAppHomePageState createState() => _LoginSampleAppHomePageState();
}

class _LoginSampleAppHomePageState extends State<LoginSampleAppHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final _auth = ScopedModel.of<AuthViewModel>(context, rebuildOnChange: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', textScaleFactor: textScaleFactor),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(height: 10.0,),
            _auth.user.avatar != null ? 
            Center(
              child: Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: DecorationImage(
                    image: NetworkImage(_auth.user.avatar),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(60.0)),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              ),
            ) : Container(
              height:  0,
            ),
            ListTile(
              title: Text('ID'),
              subtitle: _auth.user.id == null ? Text(_auth.user.id.toString()) : null,
            ),
            ListTile(
              title: Text('FirstName'),
              subtitle: _auth.user.firstname == null ? Text(_auth.user.firstname.toString()) : null,
            ),
            ListTile(
              title: Text('LastName'),
              subtitle: _auth.user.lastname == null ? Text(_auth.user.lastname.toString()) : null,
            ),
          ],
        ),
      ),
    );
  }
  

}