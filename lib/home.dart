import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bottomBar/pageGridView.dart';
import 'package:flutter_app/bottomBar/pageHorListView.dart';
import 'package:flutter_app/bottomBar/pageNestedListView.dart';
import 'package:flutter_app/object/sports.dart';
import 'package:flutter_app/object/utils.dart';

import 'bottomBar/pageListView.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget{
  @override
    _HomePageState createState() => _HomePageState() ;
}

class _HomePageState extends State<_HomePage>{

  int _currentIndex = 0;
  final List<Widget> bottomBarTabs = <Widget>[
    pageListView(),
    pageHorListView(),
    pageGridView(),
    pageNestedListView() ,
  ];

  List<Sports> sports = Utils.getSport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: bottomBarTabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            title: Text(
              "ListView"
            ),
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_sharp),
            title: Text(
                "Hor_View"
            ),
          ),


          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            title: Text(
                "GridView"
            ),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.library_add_sharp),
            title: Text(
                "Nested"
            ),
          ),

        ],

        currentIndex: _currentIndex,
        onTap: (index){
          setState((){
            _currentIndex = index;
          });
        },
        selectedFontSize: 15,
        unselectedFontSize: 8,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black12,
      ),
    );
  }
}