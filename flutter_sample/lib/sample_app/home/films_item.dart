import 'package:flutter/material.dart';
import 'package:flutter_sample/sample_app/home/models/films.dart';

class FilmsItem extends StatelessWidget {
  final Film film;
  const FilmsItem({Key key, @required this.film}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var icon = Icon(
      Icons.person,
      size: 40,
    );
    var title = Text(
      film?.title,
      style: TextStyle(
        color: Colors.red
      )
    );

    var subTitle = Text(
      film?.director,
      style: TextStyle(
        color:Colors.blue,
      ),
    );


    return Column(
      children: <Widget>[
        ListTile(
          leading: icon,
          title: title,
          subtitle: subTitle,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ],
    );
  }
}