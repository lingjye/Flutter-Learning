import 'package:dartlearning/dartgenerics.dart';
import 'package:dartlearning/dartlearning.dart';
import 'package:dartlearning/dartclasses.dart';
import 'package:dartlearning/defferLoadLibrary.dart' deferred as hello;
import 'package:dartlearning/dartasync.dart';
import 'package:dartlearning/dartAnnotation.dart';

main(List<String> arguments) {
  // 语法基础
  // dartBasics();
  // 类
  // dartclasses();
  // generics();
  // 延时库
  // greet();
  // 异步
  dartAsync();
  // 类型定义
  int sort(Object a, Object b) => 0;
  SortedCollection coll = SortedCollection(sort);
  // assert(coll.compare is Function);
  print(coll.compare is Function);
  print(coll.compare is Compare);

  // checK function type
  int checkSort(int a, int b) => a - b;
  print(checkSort is CheckCompare<int>);

  // 元数据
  var tele = MTelevision();
  // tele.activate();
  tele.turnOn();

  // Callable Classes
  var wf = WannabeFunction();
  var out = wf('Hi', 'There', 'gang');
  print(out);
}

// 延迟加载一个库
Future greet() async {
  await hello.loadLibrary();
  hello.printHello();
}

@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}