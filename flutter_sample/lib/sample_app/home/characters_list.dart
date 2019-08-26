import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/sample_app/home/character_item.dart';
import 'package:flutter_sample/sample_app/home/models/characters.dart';
import 'package:flutter_sample/sample_app/home/no_internet_connection.dart';
import 'package:flutter_sample/sample_app/home/service/home_page_view_model.dart';
import 'package:scoped_model/scoped_model.dart';

class CharactersList extends StatelessWidget {
  const CharactersList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<HomeViewModel>(
      builder: (context, child, model) {
        return FutureBuilder<List<Character>>(
          future: model.characters,
          builder: (context, AsyncSnapshot<List<Character>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator(),);
              case ConnectionState.done: {
                if (snapshot.hasData) {
                  var characters = snapshot.data;
                  return ListView.builder(
                    itemCount: characters == null ? 0 : characters.length,
                    itemBuilder: (_, int index) {
                      return CharacterItem(character: characters[index],);
                    },
                  );
                } 
              }
              return NoInternetConnection( action: () async {
                  model.setCharacters();
                },
              );
            }
          },
        );
      },
    );
  }
}