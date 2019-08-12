import 'dart:io';
import 'package:flutter/material.dart';
import 'package:first_app/login/utils/const.dart';
import 'package:native_widgets/native_widgets.dart';
import 'package:persist_theme/persist_theme.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/login/view_models/auth_view_model.dart';


class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final _auth = ScopedModel.of<AuthViewModel>(context, rebuildOnChange: true);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', textScaleFactor: textScaleFactor),
      ),
       body: SingleChildScrollView(
         child: SafeArea(
           child: ListBody(
             children: <Widget>[
               Container(height: 10.0,),
               ListTile(
                 leading: Icon(Icons.fingerprint),
                 title: Text('Enable Biometrics', textScaleFactor: textScaleFactor,),
                 subtitle: Platform.isIOS ? Text(
                   'TouchID or FaceID',
                   textScaleFactor: textScaleFactor
                 ) : Text(
                   'Fingerprint',
                   textScaleFactor: textScaleFactor
                 ),
                 trailing: NativeSwitch(
                   onChanged: _auth.handleUseBio,
                   value: _auth.useBio,
                 ),
               ),
               Divider(
                 height: 20.0,
               ),
               ListTile(
                 leading: Icon(Icons.account_box),
                 title: Text(
                   'Stay Logged In',
                   textScaleFactor: textScaleFactor,
                 ),
                 trailing: NativeSwitch(
                   onChanged: _auth.handleStayLoggedIn,
                   value: _auth.stayLoggedIn,
                 ),
               ),
               Divider(
                 height: 20.0,
              ),
              DarkModeSwitch(),
              TrueBlackSwitch(),
              CustomThemeSwitch(),
              PrimaryColorPicker(),
              AccentColorPicker(),
              DarkAccentColorPicker(),
              Divider(
                height: 20.0,
              ),
             ],
           ),
         ),
       ),
    );
  }
}