import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/asyncprogram/dart_async.dart' as dart_async;
import 'package:helloworld/asyncprogram/dart_isolate.dart' as dart_isolate;
import 'package:helloworld/gesture_touch/dart_gesture.dart' as dart_gesture;
import 'package:helloworld/my-assets/dart_assets.dart' as dart_assets;
import 'package:helloworld/widget/dart_animation.dart' as dart_animation;
import 'package:helloworld/widget/dart_custom_widget.dart' as dart_custom_widget;
import 'package:helloworld/widget/dart_manage_subwidget.dart' as dart_subwidget;
import 'package:helloworld/widget/dart_layout.dart' as dart_layout;
import 'package:helloworld/widget/dart_paniter.dart' as dart_painter;
import 'package:helloworld/widget/dart_widget.dart' as dart_widget;
import 'package:helloworld/widget/theme_demo.dart' as dart_theme;
import 'package:helloworld/navigation/dart_navigation.dart' as dart_navigation;



void main() => runApp(
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
  // dart_async.AsyncSampleApp()
  // dart_isolate.IsolateSampleApp()
  // dart_assets.MyAssetsSampleApp()
  dart_gesture.GestureSampleApp()

);
