import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:progress_hud/progress_hud.dart';

class RefreshListViewSampleApp extends StatelessWidget {
  const RefreshListViewSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: RefreshListViewSampleAppPage(),
    );
  }
}

class RefreshListViewSampleAppPage extends StatefulWidget {
  RefreshListViewSampleAppPage({Key key}) : super(key: key);

  _RefreshListViewSampleAppPageState createState() => _RefreshListViewSampleAppPageState();
}

class _RefreshListViewSampleAppPageState extends State<RefreshListViewSampleAppPage> {
  List widgets = [];
  ProgressHUD _hud;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _hud = ProgressHUD(
      backgroundColor: Colors.black26,
      color: Colors.white,
      containerColor: Colors.black,
      borderRadius: 10.0,
      text: 'loading...',
    );

    loadDatas();
  }
  
  loadDatas() {
    Future.delayed(Duration(milliseconds:2000)).then((e) {
      _hud.state.dismiss();
    }).whenComplete((){
      setState(() {
        int count = widgets.length;
        for (var i =count; i < count + 30; i++) {
          widgets.add(
            Container(
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(
                  width: 20,
                  color: Colors.green
                ),
              ),
              child: Text('index $i'),
            )
          );
        }
      });
    });
  }

  showHUD() {
    _hud.state.show();
    loadDatas();
  }

  contentView() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        listView(),
        _hud,
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(right: 20, bottom: 50),
          child: FloatingActionButton(
            child: Icon(Icons.more),
            onPressed: showHUD,
          ),
        )

      ],
    ); 
  }

  listView() {
    return ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int index) {
        return widgets[index];
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Refresh'),
       ),
       body: contentView(),
    );
  }
  
}