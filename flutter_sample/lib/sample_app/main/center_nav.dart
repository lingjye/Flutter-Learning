import 'dart:math';

import 'package:flutter/material.dart';

abstract class _BottomNavLocation extends FloatingActionButtonLocation {
  const _BottomNavLocation();

  double getDockedY(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;

    double fabY = contentBottom - fabHeight / 2.0 + 15;
    if (snackBarHeight > 0.0) {
      fabY = min(fabY, contentBottom - snackBarHeight - fabHeight - kFloatingActionButtonMargin);
    }
    if (bottomSheetHeight > 0.0) {
      fabY = min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);
    }

    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight;
    return min(maxFabY, fabY);
  }
}

// 重写
class CenterNav extends _BottomNavLocation {
  const CenterNav();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    // TODO: implement getOffset
    final double fabX = (scaffoldGeometry.scaffoldSize.width - scaffoldGeometry.floatingActionButtonSize.width) / 2.0;
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }

  @override
  String toString() => 'FloatingActionButtonLocation.endDocked';
}