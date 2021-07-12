import 'package:flutter/cupertino.dart';

class TabManager extends ChangeNotifier{
  int selectedTab = 0;
  void goToTab(index){
      selectedTab = index;
      notifyListeners();
  }

  void goToNested()
  {
    selectedTab = 3;
    notifyListeners();
  }

  void goToGridView(){
    selectedTab = 2;
    notifyListeners();
  }
}