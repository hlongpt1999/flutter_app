import 'dart:async';

class MyStream {
  int counter = 0;
  StreamController _counterController = new StreamController<int>.broadcast();
  Stream get counterStream => _counterController.stream;

  StreamController stringController = new StreamController<String>();
  Stream get stringStream => stringController.stream;

  void increment(){
    counter+=1;
    _counterController.sink.add(counter);
  }

  void decrement(){
    counter -=1;
    _counterController.sink.add(counter);
  }

  void dispose(){
    _counterController.close();
  }
}