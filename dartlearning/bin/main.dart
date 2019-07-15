import 'package:dartlearning/dartlearning.dart' as dartlearning;
import 'package:dartlearning/dartclasses.dart' as dartclasses;

main(List<String> arguments) {
  // 语法基础
  // dartlearning.dartBasics();
  // 类
  var p1 = dartclasses.Point(3, 4);
  p1.x = 3;
  print(p1.x);
  print(p1.y);
  // Getter Setter
  var rect = dartclasses.Rectangle(2, 4, 20, 15);
  rect.right = 12;
  print('rect.left:${rect.left}, rect.top:${rect.top}');

  // 隐式接口
  String greetBob(dartclasses.ImplicitPerson perspn) => perspn.greet('Bob');
  print(greetBob(dartclasses.ImplicitPerson('Kathy')));
  print(greetBob(dartclasses.Impostor())); 

  // 重写运算符

  final v = dartclasses.Vector(2, 3);
  final w = dartclasses.Vector(2, 2);

  print((v+w).x);
  print((v-w).x);

  // 枚举
  List<dartclasses.Color> colors = dartclasses.Color.values;
  print(colors);

  var aColor = dartclasses.Color.blue;
  switch (aColor) {
    case dartclasses.Color.red:
      print('Red');
      break;
    case dartclasses.Color.blue:
      print('Blue');
      break;
    case dartclasses.Color.green:
      print('Green');
      break;
  }

  

}