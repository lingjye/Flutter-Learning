package com.example.helloworld;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    // 创建与调用方标识符一样的方法通道
    new MethodChannel(getFlutterView(), "samples.demo/test").setMethodCallHandler(
            // 设置方法处理回调
            new MethodCallHandler() {
              // 响应方法请求
              @Override
              public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                // 判断方法名是否支持
                if(call.method.equals("openAppMarket")) {
                  try {
                    // 应用市场 URI
                    Uri uri = Uri.parse("market://details?id=com.demo.test.flutter_module_page.host");
                    Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    // 打开应用市场
                    activity.startActivity(intent);
                    // 返回处理结果
                    result.success(0);
                  } catch (Exception e) {
                    // 打开应用市场出现异常
                    result.error("UNAVAILABLE", " 没有安装应用市场 ", null);
                  }
                }else {
                  // 方法名暂不支持
                  result.notImplemented();
                }
              }
            });
  }

}
