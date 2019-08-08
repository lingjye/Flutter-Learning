import 'package:first_app/mvvm/services/APIService.dart';
import 'package:first_app/mvvm/view_models/main_page_view_model.dart';
import 'package:first_app/mvvm/views/widgets/characters_panel.dart';
import 'package:first_app/mvvm/views/widgets/films_panel.dart';
import 'package:first_app/mvvm/views/widgets/planets_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

final MainPageViewModel mainViewModel = MainPageViewModel(apiService: ApiService());

class MVVMSampleViewApp extends StatelessWidget {
  const MVVMSampleViewApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MVVMSampleViewAppMainPage(viewModel: mainViewModel,),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MVVMSampleViewAppMainPage extends StatefulWidget {
  final MainPageViewModel viewModel;
  MVVMSampleViewAppMainPage({Key key, @required this.viewModel}) : super(key: key);

  _MVVMSampleViewAppMainPageState createState() => _MVVMSampleViewAppMainPageState();
}

class _MVVMSampleViewAppMainPageState extends State<MVVMSampleViewAppMainPage> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    loadData();
  }

  loadData() async {
    await widget.viewModel.setFilms();
    await widget.viewModel.setCharacters();
    await widget.viewModel.setPlanets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text("Main"),
         bottom: TabBar(
           controller: tabController,
           indicatorColor: Colors.white,
           indicatorWeight:  3.0,
           tabs: <Widget>[
             Tab(icon: Icon(FontAwesomeIcons.film),),
             Tab(icon: Icon(FontAwesomeIcons.users),),
             Tab(icon: Icon(FontAwesomeIcons.globeAmericas),)
           ],
         ),
       ),
       body: ScopedModel<MainPageViewModel>(
         model: widget.viewModel,
         child: TabBarView(
           controller: tabController,
           children: <Widget>[
             FilmsPanel(),
             CharactersPanel(),
             PlanetsPanel()
           ],
         ),
        ),
    );
  }
}
