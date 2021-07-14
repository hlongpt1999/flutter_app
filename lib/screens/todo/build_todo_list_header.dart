import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buildToDoListHeader extends StatelessWidget{
  var _txtToDoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _txtToDoController,
              decoration: InputDecoration(
                labelText: "Add Todo",
                hintText: "Add todo ",
              ),
            ),
          ),

          SizedBox(width: 20,),

          RaisedButton.icon(
            onPressed: (){},
            icon: Icon(Icons.add),
            label: Text("Add"),
          ),
        ],
      ),
    );
  }
}
