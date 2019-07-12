
import 'dart:ffi';

int calculate() {
  return 6 * 7;
}

void datatype() {
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


}

void function() {

}


