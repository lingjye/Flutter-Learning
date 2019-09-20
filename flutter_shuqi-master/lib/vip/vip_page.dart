import 'package:flutter/material.dart';

class VipPage extends StatelessWidget {
  const VipPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员'),
      ),
      body: Center(
        child: Text('会员'),
      ),
    );
  }
}