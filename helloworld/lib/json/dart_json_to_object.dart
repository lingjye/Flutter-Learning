import 'dart:convert';
// import 'package:json_serializable/json_serializable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Teacher {
  String name;

  Teacher({this.name});
  factory Teacher.fromJson(Map<String, dynamic> map) {
    return Teacher(name: map['name']);
  }
}

class Student {
  int id;
  String name;
  int score;
  Teacher teacher;

  Student ({
    this.id,
    this.name,
    this.score,
    this.teacher
  });

  // Student.fromJson(Map<String, dynamic> map) {
  //   id = map['id'];
  //   name = map['name'];
  //   score = map['score'];
  // }

  factory Student.fromJson(Map<String, dynamic> map) {
    return Student(
      id: map['id'] as int,
      name: map['name'],
      score: map['score'] as int,
      teacher: Teacher.fromJson(map['teacher'])
    );
  }
}


class JsonObjectSample extends StatelessWidget {
  const JsonObjectSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: JsonObjectSampleHomePage(),
    );
  }
}

class JsonObjectSampleHomePage extends StatefulWidget {
  JsonObjectSampleHomePage({Key key}) : super(key: key);

  _JsonObjectSampleHomePageState createState() => _JsonObjectSampleHomePageState();
}

class _JsonObjectSampleHomePageState extends State<JsonObjectSampleHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Json 转 模型'),
       ),
       body: Center(
         
         child: Column(
           children: <Widget>[
             RaisedButton(
              child: Text('点击'),
              onPressed: student,
             ),
             RaisedButton(
               child: Text('异步'),
               onPressed: isolateParse,
             )
           ],
         )
       ),
    );
  }

  void student() {
    Student student = Student.fromJson({'id':1, 'name': 'json', 'score': 100, 'teacher': {'name': 'Mr Wu'}});
    print(student.name);
    print(student.teacher.name);
  }

  isolateParse() {
    var jsonString =  '{"id":1, "name": "json", "score": 100, "teacher": {"name": "Mr Wu"}}';
    print(json.decode(jsonString));
    compute(parse, jsonString).then((student)=> {print(student.teacher.name), print(student.name)});
  }

  static Student parse(String content) {
    Map jsonResponse = json.decode(content);
    Student student = Student.fromJson(jsonResponse);
    return student;
  }

}
