import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'sql_helper.dart';

class SqfliteSampleApp extends StatelessWidget {
  const SqfliteSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SqfliteSampleAppPage(),
      routes: <String, WidgetBuilder> {
        '/helper': (BuildContext context) => SQLHelperPage(),
      },
    );
  }
}

class SqfliteSampleAppPage extends StatefulWidget {
  SqfliteSampleAppPage({Key key}) : super(key: key);

  _SqfliteSampleAppPageState createState() => _SqfliteSampleAppPageState();
}

class _SqfliteSampleAppPageState extends State<SqfliteSampleAppPage> {
  Database db;

  open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    print('path: $path');

    // 删除数据库
    // await deleteDatabase(path);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database database, int version) async {
        await database.execute(
          // sql语句 创建表
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)'
        );
      }
    );
  }

  close() async {
    await db.close();
  }

  insert() async {
    // 事务
    await db.transaction((txn) async {
      int id1 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)'
      );
      print('inserted1:$id1');
      
      int id2 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)', ['another name', 5678, 3.14]
      );
      print('inserted2:$id2');
    });
    
  }

  delete() async {
    int result = await db.rawDelete(
      'DELETE FROM Test WHERE name = ?', ['some name',]
    );
    print('delete result:$result');
  }

  update() async {
    int result = await db.rawUpdate(
      'UPDATE Test SET name = ?, VALUE = ? WHERE name = ?', ['updated name', '7890', 'another name']
    );
    print('update result:$result');
  }

  lookup() async {
    List<Map> list = await db.rawQuery(
      'SELECT * FROM Test'
    );
    print('All Datas: $list');

    // 指定条件
    List<Map> expectedList = await db.rawQuery(
      'SELECT * FROM Test WHERE name = ? ORDER BY id DESC', ['updated name',]
    );
    print('ExpectedList : $expectedList');

    // 查询count
    int count = Sqflite.firstIntValue(await db.rawQuery(
      'SELECT COUNT(*) FROM Test'
    ));
    print('count = $count');
  }

  batch() async {
    Batch batch = db.batch();
    batch.insert('Test', {'name': 'item'});
    batch.update('Test', {'name': 'new_item'}, where: 'name = ?', whereArgs: ['item']);
    batch.delete('Test', where:'name = ?', whereArgs: ['new_item']);
    var results = await batch.commit();
    print(results);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('数据库'),
       ),
       body: Center(
         child: Padding(
           padding: EdgeInsets.only(top: 200),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('打开数据库'),
                  onPressed: open,
                ),
                RaisedButton(
                  child: Text('增'),
                  onPressed: insert,
                ),
                RaisedButton(
                  child: Text('删'),
                  onPressed: delete,
                ),
                RaisedButton(
                  child: Text('改'),
                  onPressed: update,
                ),
                RaisedButton(
                  child: Text('查'),
                  onPressed: lookup,
                ),
                RaisedButton(
                  child: Text('批处理'),
                  onPressed: batch,
                ),
                RaisedButton(
                  child: Text('关闭'),
                  onPressed: close,
                ),
                RaisedButton(
                  child: Text('SQL Helper'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/helper');
                  },
                )
              ],
            )
         )
       ),
    );
  }
}

class SQLHelperPage extends StatefulWidget {
  SQLHelperPage({Key key}) : super(key: key);

  _SQLHelperPageState createState() => _SQLHelperPageState();
}

class _SQLHelperPageState extends State<SQLHelperPage> {
  TodoProvider provider = TodoProvider();

  open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'helper.db');
    print('path: $path');
    provider.open(path);
  }

  insert() async {
    provider.insert(Todo.fromMap({columnTitle: 'test1', columnDone: 1}));
    provider.insert(Todo.fromMap({columnTitle: 'test2', columnDone: 1}));
  }

  delete() {
    provider.delete(2);
  }

  update() {
    provider.update(Todo.fromMap({columnTitle: 'test2', columnDone: 1}));
  }

  lookup() {
    provider.getTodo(1);
  }

  close() {
    provider.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('SQL Helper'),
       ),
       body: Center(
         child: Padding(
           padding: EdgeInsets.only(top: 200),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text('打开数据库'),
                  onPressed: open,
                ),
                RaisedButton(
                  child: Text('增'),
                  onPressed: insert,
                ),
                RaisedButton(
                  child: Text('删'),
                  onPressed: delete,
                ),
                RaisedButton(
                  child: Text('改'),
                  onPressed: update,
                ),
                RaisedButton(
                  child: Text('查'),
                  onPressed: lookup,
                ),
                RaisedButton(
                  child: Text('关闭'),
                  onPressed: close,
                ),
              ],
            )
         )
       ),
    );
  }
}