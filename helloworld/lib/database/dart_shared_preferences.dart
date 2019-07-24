import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferenceSampleApp extends StatelessWidget {
  const SharedPreferenceSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: SharedPreferenceSampleAppPage(),
    );
  }
}

class SharedPreferenceSampleAppPage extends StatelessWidget {

  Future _incrementCounter() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    // ?? 等价于 iOS中的 ?: 
    int counter = (pref.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times');
    await pref.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Shared Preferences Demo'),
       ),
       body: Center(
         child: RaisedButton(
           child: Text('Increment Counter'),
           onPressed: _incrementCounter,
         ),
       ),
    );
  }
}