import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/sample_app/home/models/films.dart';
import 'package:flutter_sample/sample_app/home/no_internet_connection.dart';
import 'package:flutter_sample/sample_app/home/service/home_page_view_model.dart';
import './films_item.dart';
import 'package:scoped_model/scoped_model.dart';

class FilmsList extends StatelessWidget {
  const FilmsList({Key key}) : super(key: key);
  
  filmList() {
    return ScopedModelDescendant<HomeViewModel> (
      builder: (context, child, model) {
        return FutureBuilder<List<Film>>(
          future: model.films,
          builder: (context, AsyncSnapshot<List<Film>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none: 
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator(),);
              case ConnectionState.done: {
                if (snapshot.hasData) {
                  var films = snapshot.data;
                  return RefreshIndicator(
                      child: ListView.builder(
                        itemCount: films == null ? 0 : films.length,
                        itemBuilder: (_, int index) {
                          Film film = films[index];
                          return FilmsItem(film: film,);
                        },
                      ),
                      onRefresh: () async {
                        await model.setFilms();
                      },
                    );  
                } else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                    model.setFilms();
                  },);
                }
              }
              return NoInternetConnection(
                    action: () async {
                    model.setFilms();
                  },);
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return filmList();
  }
}