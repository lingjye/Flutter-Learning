import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/asyncprogram/dart_async.dart' as dart_async;
import 'package:helloworld/asyncprogram/dart_isolate.dart' as dart_isolate;
import 'package:helloworld/form/dart_form.dart' as dart_form;
import 'package:helloworld/gesture_touch/dart_gesture.dart' as dart_gesture;
import 'package:helloworld/my-assets/dart_assets.dart' as dart_assets;
import 'package:helloworld/database/dart_shared_preferences.dart';
import 'package:helloworld/database/dart_sqflite.dart';
import 'package:helloworld/theme_text/dart_theme.dart' as dart_theme;
import 'package:helloworld/third_service/dart_camera.dart' as dart_picker;
import 'package:helloworld/third_service/dart_location.dart' as dart_location;
import 'package:helloworld/third_service/dart_qq_login.dart';
import 'package:helloworld/third_service/dart_xg_push.dart';
import 'package:helloworld/widget/dart_animation.dart' as dart_animation;
import 'package:helloworld/widget/dart_custom_widget.dart' as dart_custom_widget;
import 'package:helloworld/widget/dart_manage_subwidget.dart' as dart_subwidget;
import 'package:helloworld/widget/dart_layout.dart' as dart_layout;
import 'package:helloworld/widget/dart_paniter.dart' as dart_painter;
import 'package:helloworld/widget/dart_widget.dart' as dart_widget;
import 'package:helloworld/widget/theme_demo.dart' as dart_theme;
import 'package:helloworld/navigation/dart_navigation.dart' as dart_navigation;
import 'package:flutter_bugly/flutter_bugly.dart';


void main() => FlutterBugly.postCatchedException((){
  FlutterBugly.init(androidAppId: "your android app id",iOSAppId: "your iOS app id");

  runApp(
  /// Widget
  // dart_theme.MyApp()
  // dart_widget.SampleApp()
  // dart_layout.LayoutSampleApp()
  // dart_subwidget.SubWidgetSampleApp()
  // dart_animation.AnimationSampleApp()
  // dart_painter.PainterSampleApp()
  // dart_custom_widget.CustomButtonSampleApp()

  /// 导航
  // dart_navigation.NavigationSampleApp()
  // 异步
  // dart_async.AsyncSampleApp()
  // dart_isolate.IsolateSampleApp()
  // 加载本地资源
  // dart_assets.MyAssetsSampleApp()
  // 点击事件
  // dart_gesture.GestureSampleApp()
  // 主题
  // dart_theme.MaterialSampleApp()
  // 表单
  // dart_form.FormSampleApp()
  // image picker
  // dart_picker.CameraSampleApp()
  // dart_location.LocationSampleApp()
    // QQLoginSampleApp()
    // XGPushSampleApp()
    // SharedPreferenceSampleApp()
    SqfliteSampleApp()
  );
});

