import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/grocery_tile.dart';
import 'package:flutter_app/models/grocery_manager.dart';
import 'package:flutter_app/screens/grocery/toBuy_grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget{
  final GroceryManager manager;
  GroceryListScreen({Key? key, required this.manager}) :super(key: key);
  // final groceryItems = manager.groceryItems;

  @override
  Widget build(BuildContext context) {
    final groceryItems = manager.groceryItems;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Icon(Icons.delete_forever_outlined, color: Colors.white, size: 50,),
            ),
            onDismissed: (direction){
              manager.deleteItem(index);
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("${item.name} dismissed")));
            },
            child: InkWell(
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change){
                  manager.completeItem(index, change!);
                },
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => GroceryItemScreen(
                    originalItem: item,
                    onUpdate: (item){
                      manager.updateItem(item, index);
                      Navigator.pop(context);
                    },
                  ),
                ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
      ),
    );
  }

}