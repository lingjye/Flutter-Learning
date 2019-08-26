import 'package:flutter/material.dart';
import 'package:flutter_sample/sample_app/home/service/home_page_view_model.dart';
import 'package:flutter_sample/sample_app/main/main_view.dart';
import './characters_list.dart';
import './films_list.dart';
import './planets_list.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  final title = '首页';
  final HomeViewModel viewModel = HomeViewModel();
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(vsync:this, length: 3);
    loadData();
  }

  loadData() async {
    await widget.viewModel.setFilms();
    await widget.viewModel.setCharacters();
    await widget.viewModel.setPlanets();
  }

  childWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.cyan, Colors.blue, Colors.blueAccent]
            )
          ),
        ),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.personal_video), child: Text('films'),),
            Tab(icon: Icon(Icons.place), child: Text('plantes'),),
            Tab(icon: Icon(Icons.chat), child: Text('characters'),),
          ],
          controller: controller,
        ),
      ),
      body: ScopedModel<HomeViewModel>(
        model: widget.viewModel,
        // child: FilmsList(),
        child: TabBarView(
          children: <Widget>[
            FilmsList(),
            PlanetsList(),
            CharactersList(),
            
          ],
          controller: controller,
        )
      ),
      floatingActionButton: FloatingActionButton(
        // 解决多个floatActiobButton时，导航跳转崩溃问题， FAQ： https://stackoverflow.com/questions/54017447/more-than-one-floating-action-button-on-same-screen-displays-black-screen
        heroTag: null,//'unq1',
        child: Text('Theme'),
        onPressed: (){
          setState(() {
           widget.viewModel.resetDartTheme();
          });
        },
      ),
    );
  }

  childSmapleWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(child: Text('home'),),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Theme(
      child: childWidget(),
      data: widget.viewModel.isDarkTheme ? kIOSTheme : kAndroidTheme,
    );
    
  }
}