import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:first_app/mvvm/models/planet.dart';
import 'package:first_app/mvvm/utils/styles.dart';

class PlanetsListItem extends StatelessWidget {
  final Planet planet;

  PlanetsListItem({@required this.planet});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      planet?.name,
      style: TextStyle(
        color: AppStyle.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: AppStyle.titleFontSize,
      ),
    );

    var subTitle = Row(
      children: <Widget>[
        Icon(
          FontAwesomeIcons.users,
          color: AppStyle.subTitleColor,
          size: AppStyle.subTitleFontSize,
        ),
        Container(
          margin: const EdgeInsets.only(left: 7.0),
          child: Text(
            planet?.population,
            style: TextStyle(
              color: AppStyle.subTitleColor,
            ),
          ),
        ),
      ],
    );

    return Column(
      children: <Widget>[
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          title: title,
          subtitle: subTitle,
        ),
        Divider(),
      ],
    );
  }
}