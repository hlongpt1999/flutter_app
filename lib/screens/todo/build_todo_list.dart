import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/todo/build_todo_list_body.dart';
import 'package:flutter_app/screens/todo/build_todo_list_header.dart';

class buildToDoList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          buildToDoListHeader(),
          Expanded(child: buildToDoListBody()),
        ],
      ),

    );
  }



}