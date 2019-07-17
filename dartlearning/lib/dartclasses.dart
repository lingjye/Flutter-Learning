import 'dart:math';

void dartclasses() {
  var p1 = Point(3, 4);
  p1.x = 3;
  print(p1.x);
  print(p1.y);
  // Getter Setter
  var rect = Rectangle(2, 4, 20, 15);
  rect.right = 12;
  print('rect.left:${rect.left}, rect.top:${rect.top}');

  // 隐式接口
  String greetBob(ImplicitPerson perspn) => perspn.greet('Bob');
  print(greetBob(ImplicitPerson('Kathy')));
  print(greetBob(Impostor())); 

  // 重写运算符

  final v = Vector(2, 3);
  final w = Vector(2, 2);

  print((v+w).x);
  print((v-w).x);

  // 枚举
  List<Color> colors = Color.values;
  print(colors);

  var aColor = Color.blue;
  switch (aColor) {
    case Color.red:
      print('Red');
      break;
    case Color.blue:
      print('Blue');
      break;
    case Color.green:
      print('Green');
      break;
  }
}

// 类
class Point {
  // 声明实例变量x,y
  // num x = 0;
  // num y = 0;
  // 构造函数 使用{},代表参数是可选的
  // Point(num x, num y) {
  //   this.x = x;
  //   this.y = y;
  // }
  // 使用Dart语法糖
  num x, y;
  Point(this.x, this.y);
  // 命名构造函数 Named constructor
  Point.origin() {
    x = 0;
    y = 0;
  }

  Point.fromJson(Map<String, num> json)
  : x = json['x'],
    y = json['y'] {
    print('In Point.fromJson():($x, $y)');
  }

  // 实例方法
  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

  // 静态常量
  static const initialCapacity = 16;
  // 静态方法
  static num distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class Person {
  String firstName;
  // 构造函数
  Person.fromJson(Map data) {
    print('in Person');
  }
}

class Employee extends Person {
  // Person 中没有提供默认构造函数
  // 必须手动调用父类的构造函数super.fromJson(data)
  Employee.fromJson(Map data): super.fromJson(data) {
    print('in Employee');
  }
  static getDefaultData() {
    return { 'key' : 'value' };
  }

  Employee(): super.fromJson(getDefaultData());
}

// 静态构造函数
class ImmutablePoint {
    final num x;
    final num y;
    const ImmutablePoint(this.x, this.y);
    static final ImmutablePoint origin = const ImmutablePoint(0, 0);
}

class RedirectPoint {
  num x, y;
  // 主题构造函数
  RedirectPoint(this.x, this.y);
  // 重定向构造函数，指向主构造函数，函数体为空
  RedirectPoint.alongXAxis(num x) : this(x, 0);
}

// 从缓冲中返回实例
class Logger {
  final String name;
  bool mute = false;
  // _cache ‘_’代表私有属性
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}

// Setter & Getter
class Rectangle {
  num left, top, width, height;
  Rectangle(this.left, this.top, this.width, this.height);

  // 定义两个计算属性 righ ，bottom
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

// 抽象方法
abstract class Doer {
  // 定义实例变量和方法，这里定义了一个抽象方法
  void doSomething(); 
}

// 扩展
class EffectiveDoer extends Doer {
  void doSomething() {
    // 提供方法的实现，所以这里的方法不是抽象的
  }
}

// 抽象类, 不能被实例化
abstract class AbstractContainer {
  // 定义构造函数，域，方法...

  // 抽象方法
  void updateChildren();
}

// 隐式接口
class ImplicitPerson {
  // 定义私有变量
  final _name;
  // 构造函数
  ImplicitPerson(this._name);
  // 接口
  String greet(String who) => 'Hello, $who, I am $_name';
}

// Person的接口实现
class Impostor implements ImplicitPerson {
  get _name => '';
  String greet(String who) => 'Hi $who, Do you know who I am?';
}

// 一个类实现多个接口的例子
// class multiImplementsPoint implements Comparable, Location {
//   //...
// }

// 累的扩展
class Television {
  void turnOn() {
  }
}

class SmartTelevision extends Television {
  // void turnOn() {
    // super.turnOn();
  // }

  @override
  void turnOn() {
  }
}

// 重写运算符
class Vector {
  final int x, y;
  Vector(this.x, this.y);

  Vector operator + (Vector v) => Vector(x + v.x, y + v.y);
  Vector operator - (Vector v) => Vector(x - v.x, y - v.y);
  // Operator == and hashCode not shown.
}

// 重写不存在的方法
class A {
  // 除非重写 noSuchMethod,  否者将会抛出 NoSuchMethodError.
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }
}

// 枚举
enum Color { red, green, blue }

// mixins
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canCompose) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}
// Performer类
class Performer {
  // ...
  void doSomething(){
  }
}
// 使用mixin: Musical
class Musician extends Performer with Musical {

}
// mixin
mixin Aggressive {

}
// mixin
mixin Demented {

}
// 使用mixin: Musical, Aggressive, Demented
class Maestro extends Performer
    with Musical, Aggressive, Demented {
  var name;
  bool canConduct;
  Maestro(String maestroName) {
    name = maestroName;
    canConduct = true;
  }
}

// mixin 关键字 on
mixin MusicalPerformer on Musician {
  
}

// 类型定义
// class SortedCollection {
//   Function compare;
//   SortedCollection(int f(Object a, Object b)) {
//     compare = f;
//   }
// }

typedef Compare = int Function(Object a, Object b);

class SortedCollection {
  Compare compare;
  SortedCollection(this.compare);
}

/// 可调用的类
class  WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}
