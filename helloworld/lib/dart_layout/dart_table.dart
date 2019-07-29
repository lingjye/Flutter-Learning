import 'package:flutter/material.dart';

class TableSampleApp extends StatelessWidget {
  const TableSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: TableSampleAppPage(),
    );
  }
}

class TableSampleAppPage extends StatelessWidget {
  const TableSampleAppPage({Key key}) : super(key: key);

  getTable() {
    return Table(
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            TableCell(
              child: Center(
                child: Text('Index 1'),
              ),
            ),
            TableCell(
              child: Text('Index 2'),
            ),
             TableCell(
              child: Text('Index 3'),
            ),
          ]
        ),
        TableRow(
          children: <Widget>[
            TableCell(
              child: Text('index 1', textAlign: TextAlign.center,),
            ),
            Text('index 2'),
             TableCell(
              child: Text('Index 3'),
            ),
          ]
        )
        
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table'),
      ),
      body: getTable()
    );
  }
}