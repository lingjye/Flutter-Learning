import 'package:flutter/material.dart';

class Toast {
  static OverlayEntry _overlayEntry;
  static bool _showing = false;
  static DateTime _startedTime;
  static String _msg;

  static void show(
    BuildContext context,
    String msg
  ) async {
    if (msg == null) return;
    _msg = msg;

    _startedTime = DateTime.now();
    _showing = true;

    // 获取OverLayState
    OverlayState overlayState = Overlay.of(context);
    if (_overlayEntry == null) {
      // 没有Overlay 时创建

      _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Center(
          // 动画效果
          child: AnimatedOpacity(
            opacity: _showing ? 1.0 : 0,
            duration: _showing ?  Duration(milliseconds: 100) : Duration(milliseconds: 400),
            child: Card(
              color: Colors.black26,
              child: Padding(
                child: Text(_msg, style: TextStyle(color: Colors.white),),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
          )
        ),
       );
       // 将Overlay赛到State中
       overlayState.insert(_overlayEntry);
    } else {
      // 重新绘制UI,效果类似setState
      _overlayEntry.markNeedsBuild();
    }

    await Future.delayed(Duration(milliseconds: 2000));

    if (DateTime.now().difference(_startedTime).inMilliseconds >= 2000) {
      _showing = false;
      // 移除Overlay
      _overlayEntry.remove();
      _overlayEntry = null;
    }

  }
}