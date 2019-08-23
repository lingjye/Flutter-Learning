import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'localizable_strings.dart' as localizable_string;
import 'package:cached_network_image/cached_network_image.dart';

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
        // child: Image.asset('lib/my-assets/myimg.png'),
        // child: Image.file(
        //   File(
        //     'lib/my-assets/myimg.png'
        //   ),
        // ),
        // child: Image.network('https://www.w3school.com.cn/i/eg_tulip.jpg'),
        // child: FadeInImage.assetNetwork(
        //   placeholder: 'lib/my-assets/timg.gif', // 占位图
        //   image: 'https://www.w3school.com.cn/i/eg_tulip.jpg',
        //   fit: BoxFit.cover,
        // ),

        // CachedNetworkImage
        // child: Image(
        //   image: CachedNetworkImageProvider(
        //     'https://www.w3school.com.cn/i/eg_tulip.jpg',
        //   ),
        // ),
        child: CachedNetworkImage(
          imageUrl: "https://www.w3school.com.cn/i/eg_tulip.jpg",
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
      ),


      ),
    );
  }
}