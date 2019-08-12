import 'package:first_app/login/view_models/auth_view_model.dart';
import 'package:first_app/login/views/login.dart';
import 'package:first_app/login/views/register.dart';
import 'package:first_app/login/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:persist_theme/persist_theme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:provider/provider.dart';
import 'package:first_app/login/views/home_page.dart';

class LoginSampleApp extends StatefulWidget {
  LoginSampleApp({Key key}) : super(key: key);

  _LoginSampleAppState createState() => _LoginSampleAppState();
}

class _LoginSampleAppState extends State<LoginSampleApp> {
  final ThemeModel _model = ThemeModel();
  final AuthViewModel _auth = AuthViewModel();

  @override
  void initState() {
    // TODO: implement initState
    try {
      _auth.loadSettings();
    } catch (e) {
      print('Error Loading Settings: $e');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<ThemeModel>(
      builder: (_) => _model..init(),
      child: Consumer<ThemeModel>(
        builder: (context, model, child) {
          return ScopedModel<AuthViewModel>(
            model: _auth,
            child: MaterialApp(
              theme: model.theme,
              home: ScopedModelDescendant<AuthViewModel>(
                builder: (context, child, model) {
                  if (model?.user != null) return LoginSampleAppHomePage();
                  return LoginPage(username: '123',);
                },
              ),
              routes: <String, WidgetBuilder> {
                '/login': (BuildContext context) => LoginPage(),
                '/menu': (BuildContext context) => LoginSampleAppHomePage(),
                '/home': (BuildContext context) => LoginSampleAppHomePage(),
                '/settings': (BuildContext context) => SettingsPage(),
                '/create': (BuildContext context) => RegisterPage()
              },
            ),
          );
        },
      ),
    );
  }
}