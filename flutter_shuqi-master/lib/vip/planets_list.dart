import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './models/planets.dart';
import './no_internet_connection.dart';
import './service/home_page_view_model.dart';
import './planets_item.dart';
import 'package:scoped_model/scoped_model.dart';

class PlanetsList extends StatelessWidget {
  const PlanetsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<HomeViewModel> (
      builder: (context, child, model) {
        return FutureBuilder<List<Planet>>(
          future: model.planets,
          builder: (context, AsyncSnapshot<List<Planet>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done: {
                if (snapshot.hasData) {
                  var planets = snapshot.data;
                  return ListView.builder(
                    itemCount: planets == null ? 0 : planets.length,
                    itemBuilder: (_, int index) {
                      return PlanetsItem(planet: planets[index],);
                    },
                  );
                } 
              }
              return NoInternetConnection(
                    action: () async {
                      print('刷新');
                      model.setPlanets();
                  },);
            }
          },
        );
      },
    );
  }
}