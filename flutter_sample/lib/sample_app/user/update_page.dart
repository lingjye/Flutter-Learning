import '../user/models/update_model.dart';
import '../user/views/paint_view.dart';
import 'package:flutter/material.dart';
import 'package:native_widgets/native_widgets.dart';

class UpdatePage extends StatefulWidget {
  UpdatePage({Key key}) : super(key: key);

  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  UpdateModel model = UpdateModel.fromMap({
      'appIcon': 'assets/icon_img.png',
      'appName': 'APP名称-这是一个非常好玩的APP,Flutter',
      'appSize': '50.1M',
      'appDate': '2019-7-1',
      'appDescription': '这是一次完美的更新，修复了若干个Bug,这是一次完美的更新,修复了若干个Bug, 这是一次完美的更新，修复了若干个Bug,这是一次完美的更新，修复了若干个Bug',
      'appVersion': '2.0',
    });

  double rowHeight ;
  GlobalKey glkey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  double _descriptionHeight() {
    RenderBox renderBox = glkey.currentContext.findRenderObject();
      var size = renderBox.size;
      return size.height;
  }

  _afterLayout(_){
    if (_descriptionHeight() > 40.0) {
      setState(() {
        print('更新');
        model.showMoreButton = true;
      });
    }
  }

  void morePressed() {
    setState(() {
      model.isFold = !model.isFold;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('更新内容'),
         bottom: TabBar(
           tabs: <Widget>[
             Tab(icon: Icon(Icons.system_update), text: '组合',),
             Tab(icon: Icon(Icons.cake), text: '自绘'),
           ],
           controller: _tabController,
         ),
       ),
       body:TabBarView(
         controller: _tabController,
         children: <Widget>[
           ListView(
              children: <Widget>[
                UpdateItemWidget(model: model, morePressed: morePressed, anchorKey: glkey,)
              ],
            ),
          Center(child: PieView()),
         ],
       )
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }
}

class UpdateItemWidget extends StatelessWidget {
  UpdateItemWidget({Key key, this.model, this.morePressed, this.anchorKey}) : super(key: key);
  
  VoidCallback morePressed;
  final UpdateModel model;
  final GlobalKey anchorKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          topItem(),
          bottomItem()
        ],
      ),
    );
  }

  topItem() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: ClipRRect( // 圆角矩形裁剪空间
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(model.appIcon, width: 80, height: 80,),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(model.appName, maxLines: 1, overflow: TextOverflow.ellipsis,),
              Text(model.appDate, maxLines: 1, overflow: TextOverflow.ellipsis,),
            ],
          ),
          
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: FlatButton(
            child: Text('Update', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
            onPressed: () {

            },
            color: Colors.grey[300],
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
          ),
        ),
      ],
    );
  }

  bottomItem() {
     return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, model.isFold ? 10 : 30),
                  child: Text(
                    model.appDescription,
                    maxLines: (model.showMoreButton && model.isFold) ? 2 : null,
                    key: anchorKey,
                  ),
                ),
              ),
              Positioned(
                child: Offstage(
                  child: FlatButton(
                  child: Text(model.isFold ? '更多' : '收起'),
                  onPressed: morePressed,
                  color: Color.fromRGBO(255, 255, 255, 0.9),
                  textColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  offstage: !model.showMoreButton,
                ), 
                right: 0,
                bottom: 5,
                width: 60,
                height: 25,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text('Version ${model.appVersion} • ${model.appSize}'),
          )
        ],
      ),
    );
  }
  
}