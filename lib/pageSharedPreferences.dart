import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bottomBar/pageRecipes.dart';

class pageSharedPreferences extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _pageSharedPreferences(),
    );
  }
}

class _pageSharedPreferences extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _pageSharedPreferencesState();
  }
}

class _pageSharedPreferencesState extends State <_pageSharedPreferences>{

  int _currentIndex = 0;
  final List<Widget> Tabs = <Widget>[
    pageRecipes(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_dining_sharp),
            title: Text("Recipes"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text("Bookmarks"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            title: Text("Groceries"),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

}
