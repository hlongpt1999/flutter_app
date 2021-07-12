import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/grocery_item.dart';

class GroceryManager extends ChangeNotifier{
  var _groceryItems = <GroceryItem> [];
  List<GroceryItem> get groceryItems => List.unmodifiable(_groceryItems);

  void deleteItem(int index){
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  void addItem(GroceryItem item) {
    _groceryItems.add(item);
    notifyListeners();
  }
// 5
  void updateItem(GroceryItem item, int index) {
    _groceryItems[index] = item;
    notifyListeners();
  }
// 6
  void completeItem(int index, bool change)
  {
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}
