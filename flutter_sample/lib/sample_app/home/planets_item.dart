import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sample/sample_app/home/models/planets.dart';

class PlanetsItem extends StatelessWidget {
  final Planet planet;
  const PlanetsItem({Key key, @required this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var icon = Icon(
    Icons.palette,
    size: 40,
    );

    var title = Text(
      planet?.name,
      style: TextStyle(color: Colors.red),
    );

    var subTitle = Text(
      planet?.population,
      style: TextStyle(color: Colors.red),
    );
    return Column(
      children: <Widget>[
        ListTile(
          title: title,
          subtitle: subTitle,
          leading: icon,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ],
    );
  }
}