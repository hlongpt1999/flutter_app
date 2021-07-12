import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/grocery_item.dart';
import 'package:intl/intl.dart';

class GroceryTile extends StatelessWidget{
  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration? textDecoration;

  GroceryTile({Key? key, required this.item, this.onComplete}) : textDecoration =  (item.isComplete) ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(width: 5.0, color: item.color),
              const SizedBox(width: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                    style: TextStyle(
                        decoration: textDecoration,
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold),),
                  const SizedBox(height: 4.0),
                  getDate(),
                  const SizedBox(height: 4.0),
                  getImportance(),
                ],
              ),


            ],
          ),

          Row(
            children: [
              Text(item.quantity.toString(),
                style:TextStyle(
                    decoration: textDecoration,
                    fontSize: 21.0
                ),
              ),
              buildCheckbox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget getImportance(){
    if (item.importance == Importance.low) {
      return Text( 'Low',
          style: TextStyle(
              decoration: textDecoration));
    } else if (item.importance == Importance.medium) {
      return Text( 'Medium',
          style: TextStyle(
              fontWeight: FontWeight.w800,
              decoration: textDecoration));
    } else if (item.importance == Importance.high) {
      return Text('High',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.w900,
          decoration: textDecoration,
        ),
      );
    } else {
      throw Exception('This importance type does not exist');
    }
  }

  Widget getDate() {
    final dateFormatter = DateFormat('MMMM dd h:mm a');
    final dateString = dateFormatter.format(item.date);
    return Text( dateString,
      style: TextStyle(
          decoration: textDecoration),);
  }

  Widget buildCheckbox() {
    return Checkbox(
      value: item.isComplete,
      onChanged: onComplete,
    );
  }

}