import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/grocery_tile.dart';
import 'package:flutter_app/models/grocery_manager.dart';

import 'grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget{
  late final GroceryManager manager;
  final groceryItems = GroceryManager().groceryItems;

  @override
  Widget build(BuildContext context) {
    return
    // Test();
      Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: groceryItems.length,
          itemBuilder: (context, index) {
            final item = groceryItems[index];
// TODO 28: Wrap in a Dismissable
// TODO 27: Wrap in an InkWell
            return
              // Container(height: 20, color: Colors.white,
              // child: Text(groceryItems.length.toString()),);
              GroceryTile(
              key: Key(item.id),
              item: item,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 16.0);
          },
        ),
      ),
    );
  }


  Widget Test(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(color: Colors.yellow, height: 10,);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }
}