import 'package:flutter/material.dart';

class CustomButtonSampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustonButton',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Center(
        child: CustomButton('Hello'),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label; 
  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){},
      color: Colors.yellow,
      textColor: Colors.red,
      child: Text(label),
    );
  }
}