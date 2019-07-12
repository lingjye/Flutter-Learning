import 'package:flutter/material.dart';

void main(List<String> args) {
  new MaterialApp(
    title: 'title',
    theme: new ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      accentColor: Colors.cyan[600],
    ),
  );

  new Theme(
    data: new ThemeData(
      accentColor: Colors.yellow,
    ),
    child: new FloatingActionButton(
      onPressed: () {},
      child: new Icon(Icons.add),
    ),
  );

  // new Theme(
  //   data: Theme.of(context).copyWith(accentColor: Colors.yellow),
  //   child: new FloatingActionButton(
  //     onPressed: null,
  //     child: new Icon(Icons.add),
  //   ),
  // );
  
}
