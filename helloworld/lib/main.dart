import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/asyncprogram/dart_async.dart' as dart_async;
import 'package:helloworld/asyncprogram/dart_isolate.dart' as dart_isolate;
import 'package:helloworld/button/dart_button.dart';
import 'package:helloworld/dart_layout/dart_Positioned.dart';
import 'package:helloworld/dart_layout/dart_align.dart';
import 'package:helloworld/dart_layout/dart_column.dart';
import 'package:helloworld/dart_layout/dart_container.dart';
import 'package:helloworld/dart_layout/dart_expanded.dart';
import 'package:helloworld/dart_layout/dart_flow.dart';
import 'package:helloworld/dart_layout/dart_padding.dart';
import 'package:helloworld/dart_layout/dart_row.dart';
import 'package:helloworld/dart_layout/dart_stack.dart';
import 'package:helloworld/dart_layout/dart_table.dart';
import 'package:helloworld/dart_layout/dart_transform.dart';
import 'package:helloworld/dart_layout/dart_wrap.dart';
import 'package:helloworld/data_noti/inherited_widget.dart';
import 'package:helloworld/database/dart_file.dart';
import 'package:helloworld/debug_develop/config.dart';
import 'package:helloworld/device_channel/dart_native_navigation.dart';
import 'package:helloworld/device_channel/dart_native_view.dart';
import 'package:helloworld/device_channel/method_channel.dart';
import 'package:helloworld/dio/dart_dio_interceptor.dart';
import 'package:helloworld/form/dart_form.dart' as dart_form;
import 'package:helloworld/form/dart_textfiled.dart' as dart_textfiled;
import 'package:helloworld/gesture_touch/dart_gesture.dart' as dart_gesture;
import 'package:helloworld/gesture_touch/dart_multi_gesture.dart';
import 'package:helloworld/json/dart_json_to_object.dart';
import 'package:helloworld/life_cycle/life_cycle_page.dart';
import 'package:helloworld/list/dart_custom_scroll_view.dart';
import 'package:helloworld/list/dart_grid_view.dart';
import 'package:helloworld/list/dart_grid_view_builder.dart';
import 'package:helloworld/list/dart_list_view.dart';
import 'package:helloworld/list/dart_list_view_builder.dart';
import 'package:helloworld/list/dart_list_view_separated.dart';
import 'package:helloworld/list/dart_refresh_list.dart';
import 'package:helloworld/list/dart_scrollview.dart';
import 'package:helloworld/my-assets/dart_assets.dart' as dart_assets;
import 'package:helloworld/database/dart_shared_preferences.dart';
import 'package:helloworld/database/dart_sqflite.dart';
import 'package:helloworld/orientation/orientation_builder.dart';
import 'package:helloworld/state_manage/muti_provider.dart';
import 'package:helloworld/state_manage/state_provider.dart';
import 'package:helloworld/theme_text/dart_text.dart';
import 'package:helloworld/theme_text/dart_theme.dart' as dart_theme;
import 'package:helloworld/third_service/dart_camera.dart' as dart_picker;
import 'package:helloworld/third_service/dart_location.dart' as dart_location;
import 'package:helloworld/third_service/dart_qq_login.dart';
import 'package:helloworld/third_service/dart_xg_push.dart';
import 'package:helloworld/widget/dart_animation.dart' as dart_animation;
import 'package:helloworld/widget/dart_animation_builder.dart';
import 'package:helloworld/widget/dart_animation_widget.dart';
import 'package:helloworld/widget/dart_custom_widget.dart' as dart_custom_widget;
import 'package:helloworld/widget/dart_hero_animation.dart';
import 'package:helloworld/widget/dart_manage_subwidget.dart' as dart_subwidget;
import 'package:helloworld/widget/dart_layout.dart' as dart_layout;
import 'package:helloworld/widget/dart_paniter.dart' as dart_painter;
import 'package:helloworld/widget/dart_widget.dart' as dart_widget;
import 'package:helloworld/widget/theme_demo.dart' as dart_theme;
import 'package:helloworld/navigation/dart_navigation.dart' as dart_navigation;
import 'package:flutter_bugly/flutter_bugly.dart';


void main() => FlutterBugly.postCatchedException((){
  FlutterBugly.init(androidAppId: "your android app id",iOSAppId: "your iOS app id");
  // 绘制文字排版中的baseline和border
  // debugPaintBaselinesEnabled = true;
  // debugPaintLayerBordersEnabled = true;
  var configuredApp = AppConfig(
    appName: 'example', //主页标题
    apiBaseUrl: 'http://api.example.com/',
    child: dart_theme.MyApp(),
  );
  print(configuredApp.appName);
  // 空实现
  debugPrint = (String message, {int wrapWidth}){};

  debugPrint(configuredApp.apiBaseUrl);

  debugPaintSizeEnabled = true;

  runApp(configuredApp);
  // runApp(
  /// Widget
  // dart_theme.MyApp()
  // dart_widget.SampleApp()
  // dart_layout.LayoutSampleApp()
  // dart_subwidget.SubWidgetSampleApp()
  // dart_animation.AnimationSampleApp()
  // AnimationWidgetSampleApp()
  // AnimationBuilderSample()
  // HeroAnimationSample()
  // dart_painter.PainterSampleApp()
  // dart_custom_widget.CustomButtonSampleApp()
  // 布局
  // ContainerSampleApp()
  // PaddingSampleApp()
  // AlignSampleApp()
  // TransformSampleApp()
  // RowSampleApp()
  // ColumnSampleApp()
  // ExpandedSampleApp()
  // StackSampleApp()
  // PositionedSampleApp()
  // FlowSampleApp()
  // TableSampleApp()
  // WrapSampleApp()
  // 按钮
  // ButtonSampleApp()

  /// 导航
  // dart_navigation.NavigationSampleApp()
  // 异步
  // dart_async.AsyncSampleApp()
  // dart_isolate.IsolateSampleApp()
  // 加载本地资源
  // dart_assets.MyAssetsSampleApp()
  // 点击事件
  // dart_gesture.GestureSampleApp()
  // MultiGestureSampleApp()
  // 主题 与 iconfont
  // dart_theme.MaterialSampleApp()
    // TextSampleApp()
  // 表单
  // dart_textfiled.FormSampleApp()
  // dart_form.FormSampleApp()
  // image picker
  // dart_picker.CameraSampleApp()
  // dart_location.LocationSampleApp()

    // DioSample()
    // JsonObjectSample()
    // FileManageSample()
    // MethodChannelSample()
    // SampleNativeViewSample()
    // NativeNavigationSample()
    // ProviderSample()
    // MutiProviderSample()
    // QQLoginSampleApp()
    // XGPushSampleApp()
    // SharedPreferenceSampleApp()
    // SqfliteSampleApp()
    // ListViewSampleApp()
    // ListViewBuilderSampleApp()
    // ListViewSeparatedSampleApp()
    // GridViewSampleApp()
    // GridViewBuilderSampleApp()
    // ScrollViewSampleApp()
    // CustomScrollViewSampleApp()
    // RefreshListViewSampleApp()
    
    // 生命周期
    // LifeCycleApp()
    // InHeritedSampleApp()
    // OrientationBuilderSample()

  // );
});

