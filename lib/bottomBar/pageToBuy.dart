import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/models/grocery_manager.dart';
import 'package:flutter_app/screens/grocery/grocery_list_screen.dart';
import 'package:flutter_app/screens/grocery/toBuy_empty_screen.dart';
import 'package:flutter_app/screens/grocery/toBuy_grocery_item_screen.dart';
import 'package:provider/provider.dart';

class pageToBuy extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _pageToBuyState();
  }

}

class _pageToBuyState extends State<pageToBuy> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            final manager = Provider.of<GroceryManager>(context, listen: false);
            Navigator.push(context, MaterialPageRoute(
              builder:  (context) => GroceryItemScreen(
                onCreate: (item){
                  manager.addItem(item);
                  Navigator.pop(context);
                },
              ),
            ));
          },
        ),
        body: Consumer<GroceryManager>(
          builder: (context, manager, child){
            if (manager.groceryItems.isNotEmpty){
              return GroceryListScreen(manager: manager);
            }
            else{
              return EmptyGroceryScreen();
            }
          }
    ),
      );
  }
}