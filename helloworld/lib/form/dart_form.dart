import 'package:flutter/material.dart';

class FormSampleApp extends StatelessWidget {
  const FormSampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: FormSampleAppPage(),
    );
  }
}

class FormSampleAppPage extends StatefulWidget {
  FormSampleAppPage({Key key}) : super(key: key);

  _FormSampleAppPageState createState() => _FormSampleAppPageState();
}

class _FormSampleAppPageState extends State<FormSampleAppPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Form'),
       ),
       body: Form(
         key: _formKey,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             TextFormField(
               validator: (value) {
                 if (value.isEmpty) {
                   return 'Please enter some text';
                 }
                 return null;
               },
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 16.0),
               child: RaisedButton(
                 onPressed: () {
                   if (_formKey.currentState.validate()) {
                     print('表单数据检测');
                   }
                 },
                 child: Text('Submit'),
               ),
             ),
           ],
         ),
       ),
    );
  }
}