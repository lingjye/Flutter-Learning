import 'package:flutter/material.dart';
import 'package:first_app/mvvm/models/film.dart';
import 'package:first_app/mvvm/utils/styles.dart';

class FilmListItem extends StatelessWidget {
  final Film film;
  const FilmListItem({Key key, @required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = Text(
      film?.title,
      style: TextStyle(
        color: AppStyle.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: AppStyle.titleFontSize
      ),
    );

    var subTitle = Row(
      children: <Widget>[
        Icon(
          Icons.movie,
          color: AppStyle.subTitleColor,
          size: AppStyle.subTitleFontSize,
        ),
        Container(
          margin: const EdgeInsets.only(left: 4.0),
          child: Text(
            film?.director,
            style: TextStyle (
              color: AppStyle.subTitleColor,
            )
          ),
        )
      ],
    );

    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          title: title,
          subtitle: subTitle
        ),
        Divider(),
      ],
    );
  }
}