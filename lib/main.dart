import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/my_stream.dart';
import 'package:flutter_app/object/photo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  MyStream incrementStream = new MyStream();

  @override
  void dispose() {
    incrementStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Container(
              child: StreamBuilder(
                stream: incrementStream.counterStream,
                builder: (context, snapshot){
                  return Text(
                    snapshot.hasData ? snapshot.data.toString() : "0",
                    style: TextStyle(fontSize: 79, fontWeight: FontWeight.bold, color: Colors.orangeAccent),
                  );
                },
              ),

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: (){
                    incrementStream.decrement();
                  },
                  child: Icon(Icons.arrow_back),
                ),

                FloatingActionButton(
                  onPressed: (){
                    incrementStream.increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.arrow_forward_sharp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
