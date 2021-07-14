import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/base_event.dart';

abstract class BaseBloc{
  StreamController<BaseEvent> _eventStreamController = StreamController<BaseEvent>();

  Sink<BaseEvent> get event => _eventStreamController.sink;

  BaseBloc(){
    _eventStreamController.stream.listen((event) {
      if (event is! BaseEvent) throw Exception("Event is not BaseEvent");
      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event);

  @mustCallSuper
  void dispose(){
    _eventStreamController.close();
  }
}
