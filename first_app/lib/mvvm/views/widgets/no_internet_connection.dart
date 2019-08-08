import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  final VoidCallback action;
  const NoInternetConnection({Key key, @required this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Failed Connect to the internet!',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColorLight,
            child: Icon(Icons.refresh, size: 30.0),
            onPressed: action,
          ),
        )
      ],
    );
  }
}