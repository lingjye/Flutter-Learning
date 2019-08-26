import '..//home/home_page.dart';
import '../main/center_nav.dart';
import '../news/news_page.dart';
import '../news/wealth/wealth_page.dart';
import '../user/user_page.dart';
import '../post/post_page.dart';
import '../helpers/check_version.dart';
import '../helpers/custom_transition.dart';
import 'package:flutter/material.dart';

class MySampleAppMainPage extends StatefulWidget {
  MySampleAppMainPage({Key key}) : super(key: key);
  _MySampleAppMainPageState createState() => _MySampleAppMainPageState();
}

class _MySampleAppMainPageState extends State<MySampleAppMainPage> {
  int _selectedIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void _tapBottomBar(index){
    // Unhandled exception: setState() called after dispose()
    if (!mounted) return;
    if (index == 2) {
      pushPostView();
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void pushPostView() {
       Navigator.of(context).push(CustomRoute(widget: PostPage(), type: CustomTransionType.Bottom));
      // Navigator.of(context).pushNamed('/post_page');
  }

  void _checkAndUpdate() {
    // 可以在第一次打开APP时执行版本更新的网络请求
    CheckVersion _checkVersion = CheckVersion();
    // context能拿到
    _checkVersion.checkAndUpdate(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _checkAndUpdate();
  }
  
  List<Widget> items = [HomePage(), WealthPage(), Container(), NewsPage(), UserPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       key: _scaffoldKey,
       bottomNavigationBar: BottomNavigationBar(
         items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
           BottomNavigationBarItem(icon: Icon(Icons.attach_money), title: Text('财富')),
           const BottomNavigationBarItem(icon: Icon(null), title: Text('')),
           BottomNavigationBarItem(icon: Icon(Icons.new_releases), title: Text('资讯')),
           BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的')),
         ],
         type: BottomNavigationBarType.fixed,
         currentIndex: _selectedIndex,
         onTap: _tapBottomBar,
         fixedColor: Colors.red,
       ),
       //  body: items[_selectedIndex],
       // 使用IndexStack存储页面，防止页面重置  
       body: IndexedStack(
         index: _selectedIndex,
         children: items,
       ),
       floatingActionButton: Container(
         padding: EdgeInsets.all(6),
         decoration: BoxDecoration(
           border: Border.all(
             width: 1,
             color: Colors.transparent
           ),
           borderRadius: BorderRadius.all(Radius.circular(50)),
           color: Colors.white,
           boxShadow: <BoxShadow>[
             BoxShadow(
               color: Colors.grey,
               offset: Offset(0, -1),
               blurRadius: 0.2,
               spreadRadius: 0
            )
           ]
         ),
         child: FloatingActionButton(
           child: Icon(Icons.add, color: Colors.white,),
           backgroundColor: Colors.red,
           onPressed: pushPostView
          ),
       ),
       floatingActionButtonLocation: const CenterNav(),
    );
  }
}