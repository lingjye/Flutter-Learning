import 'package:flutter/cupertino.dart';


enum CustomTransionType {
  Default,
  Fade,
  Bottom,
}

class CustomRoute extends PageRouteBuilder {
  final Widget widget;
  final CustomTransionType type;

  CustomRoute({this.widget, this.type = CustomTransionType.Default}) : super(
    transitionDuration:Duration(milliseconds: 300),
    pageBuilder:(
      // 上下文及动画
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
    ){
      return widget;
    },

    transitionsBuilder:(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child,
    ) {
      switch (type) {
        case CustomTransionType.Default: {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1.0, .0),
              end: Offset(0.0, 0.0),
            ).animate(CurvedAnimation(
              curve: Curves.fastOutSlowIn,
              parent: animation1,
            )),
            child: child,
          );
        } 
          break;
        case CustomTransionType.Bottom: {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.0, 1.0),
              end: Offset(0.0, 0.0),
            ).animate(CurvedAnimation(
              curve: Curves.fastOutSlowIn,
              parent: animation1,
            )),
            child: child,
          );
        }
          break;
        case CustomTransionType.Fade: {
          // 动画
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation1,
            curve: Curves.fastOutSlowIn
            )),
            child: child,
          );
        }
          break;
        default:
      }
      
    }
  );

}