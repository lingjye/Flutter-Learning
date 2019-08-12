import 'package:first_app/login/utils/pop_up.dart';
import 'package:first_app/login/views/register.dart';
import 'package:flutter/material.dart';
import 'package:native_widgets/native_widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:first_app/login/view_models/auth_view_model.dart';
import 'package:first_app/login/utils/const.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.username}) : super(key: key);
  final String username;
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _status = 'no-action';
  String _username, _password;
  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _controllerUsername, _controllerPassword;
  
  @override
  void initState() {
    // TODO: implement initState
    _controllerUsername = TextEditingController(text: widget.username ?? '');
    _controllerPassword = TextEditingController(text: '');
    _loadUsername();
    print(_status);
    super.initState();
  }

  void _loadUsername() async{
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _username = _prefs.getString('saved_username') ?? '';
      var _rememberMe = _prefs.getBool('remember_me') ?? false;
      if (_rememberMe) {
        _controllerUsername.text = _username ?? '';
      }
    } catch (e) {
      print('用户信息获取失败：$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthViewModel _auth =  ScopedModel.of<AuthViewModel>(context, rebuildOnChange:true); //AuthViewModel();
    
    return Scaffold(
       key: _scaffoldKey,
       body: SafeArea(
         child: ListView(
           physics: AlwaysScrollableScrollPhysics(),
           key: PageStorageKey('Divider 1'),
           children: <Widget>[
             SizedBox(
               height: 220,
               child: Padding(
                 padding: EdgeInsets.all(16.0),
                 child: Icon(
                   Icons.person,
                   size: 175.0,
                 ),
               ),
             ),
             Form(
               key: formKey,
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   ListTile(
                     title: TextFormField(
                       decoration: InputDecoration(labelText: 'Username'),
                       validator: (val) => val.length < 1 ? '请输入用户名' : null,
                       onSaved: (val) => _username = val,
                       obscureText: false,
                       controller: _controllerUsername,
                       autocorrect: false,
                       keyboardType: TextInputType.phone,
                     ),
                   ),
                   ListTile(
                     title: TextFormField(
                       decoration: InputDecoration(labelText: 'Password'),
                       validator: (val) => val.length < 1 ? '请输入密码' : null,
                       onSaved: (val) => _password = val,
                       obscureText: true,
                       controller: _controllerPassword,
                       autocorrect: false,
                       keyboardType: TextInputType.text,
                     ),
                   ),
                   ListTile(
                     title: Text('Rememeber Me', textScaleFactor: textScaleFactor,),
                     trailing: NativeSwitch(
                       onChanged: _auth.handleRememberMe,
                       value: _auth.rememberMe,
                     ),
                   ),
                   ListTile(
                     title: NativeButton(
                       child: Text(
                         'login',
                         textScaleFactor: textScaleFactor,
                         style: TextStyle(color: Colors.white),
                       ),
                       color: Colors.blue,
                       onPressed: () {
                         final form = formKey.currentState;
                         if (form.validate()) {
                           form.save();
                           final snackbar = SnackBar(
                             duration: Duration(seconds: 30),
                             content: Row(
                               children: <Widget>[
                                 NativeLoadingIndicator(),
                                 Text('正在登录...'),
                               ],
                             ),
                           );
                           _scaffoldKey.currentState.showSnackBar(snackbar);

                           setState(() => this._status = 'loading' );

                           _auth.login(
                             username: _username.toString().trim(),
                             password: _password.toString().trim(),
                           ).then((result){
                             if (!result) {
                               setState(() => this._status = 'rejected');
                               showAlertPopup(context, '提示', _auth.errorMsg);
                             }
                             _scaffoldKey.currentState.hideCurrentSnackBar();
                           });
                         }
                       },
                     ),
                   ),
                   NativeButton(
                     child: Text(
                       '注册',
                       textScaleFactor: textScaleFactor,
                     ),
                     onPressed: () {
                       Navigator.push(context, MaterialPageRoute(
                         builder: (context) => RegisterPage(),
                         fullscreenDialog: true,
                       )).then((success) {
                         if (success == true) {
                           showAlertPopup(context, '提示', '注册成功，立即登录');
                         }
                       });
                     },
                   ),
                 ],
               ),
             )
           ],
         ),
       ),
    );
  }
}