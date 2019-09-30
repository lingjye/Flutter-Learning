//import '../helpers/life_cycle_observer.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  PostPage({Key key}) : super(key: key);

  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init');
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('发布'),
      ),
      body: ListView(
        children: <Widget>[
          IntrinsicHeight(
            child: Row(
              children: <Widget>[
                Expanded(flex: 1, child: Container(color: Colors.blue, height: 300,),),
                Container(color: Colors.red, width: 50, ),
                Container(color: Colors.yellow, width: 50,  height: double.infinity,)
              ],
            ),
          ),

          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Container(color: Colors.blue, height: 300,),),
              Container(color: Colors.red, width: 50, height: 100,),
              Container(color: Colors.yellow, width: 50, height: 100,),
            ],
          )
        ],
      ),
    );
  }
}