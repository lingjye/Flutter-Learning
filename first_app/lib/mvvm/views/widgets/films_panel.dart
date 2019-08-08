import 'package:flutter/material.dart';
import 'package:first_app/mvvm/view_models/main_page_view_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/mvvm/models/film.dart';
import 'films_list_item.dart';
import 'no_internet_connection.dart';

class FilmsPanel extends StatelessWidget {
  const FilmsPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel>(
      builder: (cotext, child, model) {
        return FutureBuilder<List<Film>>(
          future: model.films,
          builder: (context, AsyncSnapshot<List<Film>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: const CircularProgressIndicator(),);
              case ConnectionState.done:
                if(snapshot.hasData) {
                  var films = snapshot.data;
                  return ListView.builder(
                    itemCount: films == null ? 0 : films.length,
                    itemBuilder: (_, int index) {
                      var file = films[index];
                      return FilmListItem(film: file,);
                    },
                  );
                } else if (snapshot.hasError) {
                  return NoInternetConnection(
                    action: () async {
                      await model.setFilms();
                      await model.setCharacters();
                      await model.setPlanets();
                    }
                  );
                }
            }
          },
        );
      },
    );
  }
}