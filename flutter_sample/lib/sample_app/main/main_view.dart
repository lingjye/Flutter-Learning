
import '../helpers/life_cycle_observer.dart';
import '../helpers/routes/routes.dart';
import '../user/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './main_page_view.dart';

class MySampleApp extends StatelessWidget {
  const MySampleApp({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    LifeCycleObserver.instance.startObserver();

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(152, 202, 83, 1),
        primaryColorBrightness: Brightness.dark,
      ),
      home:  MySampleAppMainPage(),
      routes: Router.routes, 
    );
  }
}




