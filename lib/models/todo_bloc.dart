import 'dart:async';

import 'package:flutter_app/events/todo_add_event.dart';
import 'package:flutter_app/events/todo_delete_event.dart';
import 'package:flutter_app/models/base_bloc.dart';
import 'package:flutter_app/models/base_event.dart';
import 'package:flutter_app/object/todo.dart';

class TodoBloc extends BaseBloc{
  StreamController<List<Todo>> _todoListStreamController =  StreamController<List<Todo>>();

  _addTodo(Todo todo){

  }

  _deleteTodo(Todo todo){

  }

  @override
  void dispatchEvent(BaseEvent event) {
    if (event is TodoAddEvent){

    }else if(event is TodoDeleteEvent)  {

    }
  }

  @override
  void dispose() {
    super.dispose();
    _todoListStreamController.close();
  }
}