import 'package:dartlearning/dartlearning.dart' as dartlearning;

main(List<String> arguments) {
  dartlearning.datatype();
  
  print('Hello world: ${dartlearning.calculate()}!');
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

  int a = 1;
  int b = 1;
  // 判断相等
  if (a == b) print('1');

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

  // 捕获异常
  try{
    print('123');
  } on Exception catch (e) {
    print('Exception details:\n $e');
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  } finally {
    print('Finally');
  }
}


