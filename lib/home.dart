import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bottomBar/pageGridView.dart';
import 'package:flutter_app/bottomBar/pageHorListView.dart';
import 'package:flutter_app/bottomBar/pageNestedListView.dart';
import 'package:flutter_app/bottomBar/pageToBuy.dart';
import 'package:flutter_app/models/models.dart';
import 'package:flutter_app/object/sports.dart';
import 'package:flutter_app/object/utils.dart';
import 'package:flutter_app/screens/toBuy_empty_screen.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'bottomBar/pageListView.dart';
import 'models/grocery_manager.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context)=>GroceryManager()),
            ChangeNotifierProvider(create: (context)=> TabManager())
          ],
          child: _HomePage()
      ),
    );
  }
}

class _HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState() ;
}

class _HomePageState extends State<_HomePage>{

  int _currentIndex = 0; // SetState of StatefulWidget.
  final List<Widget> bottomBarTabs = <Widget>[
    pageListView(),
    pageHorListView(),
    pageGridView(),
    pageNestedListView() ,
    pageToBuy(),
  ];

  List<Sports> sports = Utils.getSport();
  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(),
        body: bottomBarTabs[tabManager.selectedTab],
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

            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              title: Text(
                  "To Buy"
              ),
            ),

          ],

          currentIndex: tabManager.selectedTab,
          onTap: (index){
            // setState((){
            //   _currentIndex = index;
            // });
            tabManager.goToTab(index);
          },
          selectedFontSize: 15,
          unselectedFontSize: 8,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black12,
        ),
      );

    },);
  }
}