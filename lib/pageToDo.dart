import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/todo/build_todo_list.dart';

class pageToDo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.black,
        primarySwatch: Colors.orange,
      ),
      home: pageToDoApp(),
    );
  }

}

class pageToDoApp extends StatefulWidget{
  _pageToDoAppState createState() => _pageToDoAppState();
}

class _pageToDoAppState extends State<pageToDoApp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BLOC + STREAM",),),
      body: buildToDoList(),
    );
  }
}

