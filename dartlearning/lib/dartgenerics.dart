// 泛型

void generics() {
  // list
  var names = List<String>();
  names.addAll(['a', 'b', 'c']);
  // names.add(1); // 错误
  // 参数化
  var namesList = <String>['a', 'b', 'c'];
  var uniqueNames = <String>{'a', 'b', 'c'};
  var pages = <String, String> {
    'index.html' : 'Homepage',
    'robots.txt' : 'Hints for web robots',
    'humans.txt' : 'we are people, not machines'
  };

  // 使用带有参数化类型的构造函数
  var nameSet = Set<String>.from(names);
  var views = Map<int, View>();

  // 通用集合及其包含的类型
  bool b = names is List<String>;
  print('result:$b'); //true

  // 限制参数类型
  var someBaseClassFoo = Foo<SomeBaseClass>();
  // 可以使用子类
  var extenderFoo = Foo<Extender>();
  // 也可以不指定泛型的类型
  var foo = Foo();
  print(foo);
}

class View {

}

// 缓存对象
abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

// 缓存字符串
abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}

// 泛型
abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

// 限制参数类型
// class Foo<T extends SomeBaseClass>
class SomeBaseClass {

}

class Foo<T extends SomeBaseClass> {
  // Implementation goes here
  String toString() => "Instace of 'Foo<$T>'";
}

class Extender extends SomeBaseClass {
  //do something
}

// 泛型方法
T first<T>(List<T> ts) {
  // Do some initial work or error checking, then...
  T tmp = ts[0];
  // Do some additional checking or processing...
  return tmp;
}