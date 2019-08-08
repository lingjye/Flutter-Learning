import 'package:first_app/mvvm/models/character.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/mvvm/view_models/main_page_view_model.dart';
import 'no_internet_connection.dart';
import 'characters_list_item.dart';

class CharactersPanel extends StatelessWidget {
  const CharactersPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainPageViewModel> (
      builder: (context, child, model) {
        return FutureBuilder<List<Character>> (
          future: model.characters,
          builder: (_, AsyncSnapshot<List<Character>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator(),);
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var characters = snapshot.data;
                  return ListView.builder(
                    itemCount: characters == null ? 0 : characters.length,
                    itemBuilder: (_, int index) {
                      var character = characters[index];
                      return CharactersListItem(character: character,);
                    },
                  );
                } else if (snapshot.hasError){
                  return NoInternetConnection(
                    action: () async {
                      await model.setFilms();
                      await model.setCharacters();
                      await model.setPlanets();
                    },
                  );
                }
            }
          }
          ,
        );
      },
    );
    
  }
}