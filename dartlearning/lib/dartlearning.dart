int calculate() {
  return 6 * 7;
}

void dartBasics() {
  // 2.5 
  var result1 = 5/2;
  // 整除
  var result2 = 5 ~/ 2;
  print('result:$result1, result2:$result2');

  String x = '1234';
  // as是类型转换, is ：True, is! ：False
  if (x is! num) {
    print('1');
  } else {
    print('2');
  }

  // 赋值操作符
  String s1 = 'abc';
  String s2 = null;
  String s3 = 'def';
  String s4 = null;
  // 如果时=null则赋值s1给s2,否则a不变
  s2 ??= s1;
  s3 ??= s1;
  print('s2=$s2, s3=$s3');

  // 如果 ?? 左侧表达式为null，返回其值，否则执行右侧表达式
  print('result=${s1 ?? s3}, result2 = ${s4 ?? s3}');

  // Dart里是强类型的，也有自动推断类型的机制
  // 在Dart里定义变量使用有 var, const, dynamic, object, 类型等方式
  // 基本数据类型 number:int double
  int a = 3, b = 2;
  var c = a + b;
  print('$a, $b,a+b=$c');
  
  double f = 1.555;
  print(f);
  

  // String 
  String str = 'I am dart';
  var str1 = 'I am dart';
  print(str);
  print(str1 == str);

  // 函数类型， block
  add(var c, var d) {
    a = d;
    return c + d;
  }
  print(add(3, 21));
  print(a);
  
  var name = 'Dart';
  print(name);
  
  var compareresult = str == str1;
  print(compareresult);

  // list
  // var l1 = List();
  var l1 = [1, 2, 3, 4];
  l1.add(5);
  l1.clear();
  l1.addAll([10, 11, 12, 13, 14]);
  l1.remove(1);
  l1.removeAt(0);
  l1.insert(0, 6);
  l1.replaceRange(0, 1, [8, 9]);
  l1.removeLast();
  print(l1);
  print(l1.first);
  print(l1.last);
  print(l1[1]);
  l1.removeRange(0, 1);
  l1.removeWhere((item)=>item == 8);
  print(l1);
  // 排序 传入一个函数作为参数， 从大到小
  l1.sort((a, b) => b.compareTo(a));
  print(l1);
  // 添加另一个数组的所有元素
  var l2 = [0, ... l1]; 
  print(l2);

  // set new是可选的
  var set1 = new Set();
  set1.add(1);
  // 添加数组
  set1.addAll(['a', 'b']);
  print(set1);
  var set2 = new Set.of([1, 2]);
  print(set2);
  print(set1.contains(1));
  set1.remove(1);
  set1.clear();

  // 指定类型
  var set3 = <String>{ 'a', 'b', 'c' };
  print(set3);

  final constantSet = const {'a', 'b', 'c'};
  // constantSet.add('d'); 报错，不能修改
  print(constantSet);
  
  // Map
  // 推断类型 Map<String, String>
  var map1 = { 'key1' : 'value1', 'key2' : 'value2' };
  print(map1);
  // Map<int, String>
  var map2 = { 2 : 'value1', 3 : 'value2' };
  print(map2);
  // 使用构造函数创建, Map可变的
  var map3 = Map();
  map3['key1'] = 'value1';
  // 指定类型
  var map4 = Map<int, String>();
  map3[2] = 'value2';
  print(map3);
  // 断言， 如果在Map中找不到对应的键，则返回null
  assert(map3['key2'] == null); 
  // 长度
  print(map3.length);
  // 常量
  final constantMap = const { 'key1' : 'value1'};

  // Runes 
  var r1 = '\u{1f44f}';
  print(r1);
  print(r1.codeUnits);
  print(r1.runes.toList());

  Runes input = Runes(
    '\u2665 \u{1f605} \u{1f60e} \u{1f47b} \u{1f596} \u{1f44d}'
  );
  print(String.fromCharCodes(input));

  // Functions 
  // 类型bool可以省略
  bool compareNumber(int a, int b) {
    return a > b;
  }
  print(compareNumber(1, 2));

  // 对于质保函一个表达式的函数简写
  bool isEvenNumber(int a) => a % 2 == 0;
  print(isEvenNumber(2));
  
  // 可选参数
  // {param1, param2, ...}
  ///设置[bold]和[hidden]标志...
  void enableFlags({ bool bold, bool hidden }){
    // ...
  };

  // 可选位置参数
  String say(String from, String msg, [ String device ]) {
    var result = from + msg + device;
    return result;
  };  

  // 默认参数值
  enableFlags1({bool bold = true}) {
    // ...
  };

  // 将函数作为参数
  void printElement(int element) {
    print(element);
  }
  var l = [1, 2, 3];
  // 参数为函数
  l.forEach(printElement); 

  // 匿名函数, 打印元素
  var list = ['a', 'b', 'c'];
  list.forEach( 
    // 参数f是一个函数，这里使用不指定名称的匿名函数
    (item) {
      print(item);
    }
  );

  // 词法闭包
  var add2 = makeAdder(2);
  var add4 = makeAdder(4);
  // Closure: (num) => num
  print(add2);
  assert(add2(3) == 5);
  assert(add4(3) == 7);

  // Switch-case
  var casement = 'a';
  switch (casement) {
    case 'a':
      print('Find a');
      break;
    case 'b':
      print('Find b');
      break;
    default:
      break;
  }

  // throw 
  // throw FormatException('预计至少有1个部分'); 
  try {
    throw FormatException('预计至少有1个部分');
  } catch(e){
    print(e);
    // 重新抛出
    // rethrow;
  };

  // 捕获异常
  try {
    // 抛出异常
    // throw FormatException('预计至少有1个部分'); 
    throw Exception('预计至少有1个部分'); 
  } on FormatException catch(e) {
    print(e);
    // 重新抛出
    // rethrow;
  } catch(e){
      print('抛出的异常：$e');
  } finally {
    print('结束');
  };
}

// 返回一个将[addBy]添加到 函数参数的函数。
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}

