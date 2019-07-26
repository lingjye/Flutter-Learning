
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

final String tableTodo = 'todo';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnDone = 'done';

class Todo {
  int id;
  String title;
  bool done;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      columnTitle: title,
      columnDone: done == true ? 1 : 0,
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Todo();

  Todo.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    done = map[columnDone] == 1;
  }
}

class TodoProvider {
  Database db;
  // 打开数据库
  Future open(String path) async {
    db = await openDatabase(path, version: 1, onCreate: (Database database, int version) async {
      await database.execute(
        '''
        create table $tableTodo (
          $columnId integer primary key autoincrement,
          $columnTitle text not null,
          $columnDone integer not null
        )
        '''
      );
    });
  }
  // 插入数据
  Future<Todo> insert(Todo todo) async {
    todo.id = await db.insert(tableTodo, todo.toMap());
    print('todo.id=${todo.id}');
    return todo;
  }

  // 通过id查询
  Future<Todo> getTodo(int id) async {
    List<Map> maps = await db.query(tableTodo,
      columns: [columnId, columnTitle, columnDone],
      where: '$columnId = ?',
      whereArgs: [id],
    );
    if (maps.length > 0) {
      print('maps:$maps');
      return Todo.fromMap(maps.first);
    }
    return null;
  }

  // 删除
  Future<int> delete(int id) async {
    return await db.delete(tableTodo,
      where: '$columnId = ?',
      whereArgs: [id]);
  }

  // 更新
  Future<int> update(Todo todo) async {
    return await db.update(tableTodo, 
      todo.toMap(),
      where: '$columnId = ?',
      whereArgs: [todo.id]
    );
  }

  // 关闭
  Future close() async => db.close();
}

class MainItem {
  
}