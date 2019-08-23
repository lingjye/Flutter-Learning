import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PieView extends StatelessWidget {
  const PieView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(200, 200),
        painter: PiePainter(),
      ),
    );
  }
}

class PiePainter extends CustomPainter {
  // 设置画笔颜色属性
  Paint getColoredPaint(Color color) {
    Paint paint = Paint(); 
    paint.color = color;
    return paint;
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double pieSize = min(size.width, size.height);
    double nbElem = 6; // 6分
    double radius = (2 * pi) / nbElem;

    Rect boundingRect = Rect.fromCircle(center: Offset(pieSize/2, pieSize), radius: pieSize);

    canvas.drawArc(boundingRect, 0, radius, true, getColoredPaint(Colors.red));
    canvas.drawArc(boundingRect, radius, radius , true, getColoredPaint(Colors.green));
    canvas.drawArc(boundingRect, radius* 2, radius  , true, getColoredPaint(Colors.orange));
    canvas.drawArc(boundingRect, radius* 3, radius, true, getColoredPaint(Colors.cyan));
    canvas.drawArc(boundingRect, radius* 4, radius, true, getColoredPaint(Colors.blue));
    canvas.drawArc(boundingRect, radius* 5, radius, true, getColoredPaint(Colors.orange));


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }

}