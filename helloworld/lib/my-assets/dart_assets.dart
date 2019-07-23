import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'localizable_strings.dart' as localizable_string;

Future<String> loadAsset() async {
  return await rootBundle.loadString('my-assets/mydata.json');
}

class MyAssetsSampleApp extends StatelessWidget {
  const MyAssetsSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue,
      title: 'Assets',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home:  AssetsSampleAppPage(),
    );
      
  }
}

class AssetsSampleAppPage extends StatelessWidget {
  const AssetsSampleAppPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Assets'),
        title: Text(localizable_string.Strings.welcomeMessage),
      ),
      body: Center(
        child: Image.asset('lib/my-assets/myimg.png'),
      ),
    );
  }
}