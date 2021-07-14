import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buildToDoListBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _buildToDoListBodyState();
  }
}

class _buildToDoListBodyState extends State<buildToDoListBody>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index){
          return ListTile(
            title: Text("Todo + $index"),
            trailing: GestureDetector(
              onTap: (){},
              child: Icon(Icons.cancel_outlined, color: Colors.blueAccent,),
            ),
          );
        }
    );
  }

}