import 'package:first_app/login/utils/pop_up.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_widgets/native_widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/login/view_models/auth_view_model.dart';
import 'package:first_app/login/utils/const.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _username, _password;
  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _controllerUsername, _controllerPassword;
  @override
  void initState() {
    // TODO: implement initState
    _controllerUsername = TextEditingController();
    _controllerPassword = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _auth = ScopedModel.of<AuthViewModel>(context, rebuildOnChange: true);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('注册', textScaleFactor: textScaleFactor,),
      ),
      body: SafeArea(
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          key: PageStorageKey('Divider 1'),
          children: <Widget>[
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
                      obscureText: false,
                      controller: _controllerPassword,
                      autocorrect: false,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  ListTile(
                    title: NativeButton(
                      child: Text(
                        '保存',
                        textScaleFactor: textScaleFactor,
                        style: TextStyle(color: Colors.white,),
                      ),
                      color: Colors.blue,
                      onPressed: () async {
                        final form = formKey.currentState;
                        if (form.validate()) {
                          form.save();
                          final snackbar = SnackBar(
                            duration: Duration(seconds: 3),
                            content: Row(
                              children: <Widget>[
                                NativeLoadingIndicator(),
                                Text('Signing Up...'),
                              ],
                            ),
                          );
                          _scaffoldKey.currentState.showSnackBar(snackbar);

                          _auth.login(
                            username: _username.toString().trim(),
                            password: _password.toString().trim()
                          ).then((result) async {
                            if (result) {
                              final snackbar = SnackBar(
                                duration: Duration(seconds: 3),
                                content: Row(
                                  children: <Widget>[
                                    NativeLoadingIndicator(),
                                    Text('登录中...'),
                                  ],
                                ),
                              );
                              _scaffoldKey.currentState.showSnackBar(snackbar);
                              // 模拟延时
                              await Future.delayed(Duration(seconds:3));
                              _scaffoldKey.currentState.hideCurrentSnackBar();
                              // 向外部传值，回调
                              Navigator.pop(context, true);
                            } else {
                              _scaffoldKey.currentState.hideCurrentSnackBar();
                              showAlertPopup(context, '提示', '登录失败, ${_auth.errorMsg}');
                            }
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}