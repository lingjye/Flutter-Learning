import 'dart:async';
import 'dart:io';

Future<void> dartAsync() async {
  // checkVersion();
  try {
    // assert(1==2);
    var version = await checkVersion();
    print('version is :$version');
  } catch (e) {
    print(e);
  } finally {
    print('over');
  }

  // 匿名函数
  // String syncLookUpVersion() => '1.0.0';
  // 修改为异步
  Future<String> asyncLpokUpVersion() async => '1.0.0';
  print(await asyncLpokUpVersion());

}

Future checkVersion() async {
  return await lookUpVersion();
}

Future lookUpVersion() async {
  sleep(Duration(seconds: 1));
  return '1.0.0';
}

/// await for
Future awaitForExample() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum);
}

// 使用async*函数生成简单的整数流
Stream<int> countStream(int number) async* {
  for (int i = 0; i < number; i++) {
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}


/// 生成器
// 同步
Iterable<int> naturalsTo(int n) sync* {
  int k = 0;
  while (k < n) {
    yield k++;
  }
}

// 异步
Stream<int> asyncNaturalsTo(int n) async* {
  int k = 0;
  while (k < n) {
    yield k++;
  }
}

// yield * 表示生成器递归
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}

