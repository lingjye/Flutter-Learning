import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shuqi/public.dart';
import 'package:shuqi/home/home_scene.dart';
import 'package:shuqi/bookshelf/bookshelf_scene.dart';
import 'package:shuqi/me/me_scene.dart';
import 'package:shuqi/vip/home_page.dart';
import './center_nav.dart';
import './custom_transition.dart';
import './post_page.dart';

class RootScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootSceneState();
}

class RootSceneState extends State<RootScene> {
  int _tabIndex = 3;
  bool isFinishSetup = false;
  List<Image> _tabImages = [
    Image.asset('img/tab_bookshelf_n.png'),
    Image.asset('img/tab_bookstore_n.png'),
    null,
    Image.asset('img/tab_writer_n.png'),
    Image.asset('img/tab_me_n.png'),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('img/tab_bookshelf_p.png'),
    Image.asset('img/tab_bookstore_p.png'),
    null,
    Image.asset('img/tab_writer_p.png'),
    Image.asset('img/tab_me_p.png')
  ];

  @override
  void initState() {
    super.initState();

    setupApp();

    eventBus.on(EventUserLogin, (arg) {
      setState(() {});
    });

    eventBus.on(EventUserLogout, (arg) {
      setState(() {});
    });

    eventBus.on(EventToggleTabBarIndex, (arg) {
      setState(() {
        _tabIndex = arg;
      });
    });
  }

  @override
  void dispose() {
    eventBus.off(EventUserLogin);
    eventBus.off(EventUserLogout);
    eventBus.off(EventToggleTabBarIndex);
    super.dispose();
  }

  setupApp() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isFinishSetup = true;
    });
  }
  List<Widget> items = [
    BookshelfScene(),
    HomeScene(),
    Container(),
    HomePage(),
    MeScene(),];

  void _pushPostView() {
    Navigator.of(context).push(CustomRoute(widget: PostPage(), type: CustomTransionType.Bottom));
    // Navigator.of(context).pushNamed('/post_page');
    // UnknownRoute
    // Navigator.of(context).pushNamed('post_unknown');
  }

  @override
  Widget build(BuildContext context) {
    if (!isFinishSetup) {
      return Container();
    }

    return Scaffold(
      body: IndexedStack(
        children: items,
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: SQColor.primary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text('书架')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text('书城')),
          const BottomNavigationBarItem(icon: Icon(null), title: Text('')),
          BottomNavigationBarItem(icon: getTabIcon(3), title: Text('会员')),
          BottomNavigationBarItem(icon: getTabIcon(4), title: Text('我的')),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          if (index == 2) {
             _pushPostView();
            return;
          }
          setState(() {
            _tabIndex = index;
          });
        },
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
            onPressed: _pushPostView
        ),
      ),
      floatingActionButtonLocation: const CenterNav(),
    );
  }

  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
