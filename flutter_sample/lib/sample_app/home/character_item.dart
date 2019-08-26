import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sample/sample_app/home/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key key, @required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var icon = Icon(
      Icons.person_add,
      size: 40,
    );

    var title = Text(
      character?.name,
      style: TextStyle(
        color: Colors.red,
      ),
    );

    var subTitle = Text(
      character?.birthYear,
      style: TextStyle(
        color: Colors.blue
      ),
    );

    return Column(
      children: <Widget>[
        ListTile(
          leading: icon,
          title: title,
          subtitle: subTitle,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        )
      ],
    );
  }
}