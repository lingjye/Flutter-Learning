import '../helpers/life_cycle_observer.dart';
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
       body: Container(
         color: Colors.black12,
       ),
    );
  }
}