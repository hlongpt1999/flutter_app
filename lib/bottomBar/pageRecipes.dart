import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pageRecipes extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _pageRecipesState();
  }
}

class _pageRecipesState extends State<pageRecipes>{
    List<String> currentSearchList = [];

  TextEditingController searchTextController = new TextEditingController();

  static const String prefSearchKey = 'previousSearches';
  bool inErrorState = false;
  List<String> previousSearches = [ ];



  @override
  void initState() {
    super.initState();
    getPreviousSearches();
  }

  @override
  void dispose() {
    savePreviousSearches();
    super.dispose();
  }

  void savePreviousSearches() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(prefSearchKey, previousSearches);
  }

  void getPreviousSearches() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(prefSearchKey)) {
      previousSearches = prefs.getStringList(prefSearchKey)!;
      if (previousSearches == null) {
        previousSearches = <String>[];
      }
    }
  }

  void startSearch(String value) {
    setState(() {
      if (!previousSearches.contains(value))
      {
        if(searchTextController!=null){
          previousSearches.add(value);
          savePreviousSearches();
        }
        searchTextController.clear();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  startSearch(searchTextController.text);
                },
              ),

              Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Search'),
                    autofocus: false,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                      if (!previousSearches.contains(value)) {
                        previousSearches.add(value);
                        savePreviousSearches();
                      }
                    },
                    controller: searchTextController,
                  )
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:20),
            height: 500,
            child: ListView.builder(
              itemCount: previousSearches.length,
              itemBuilder: (BuildContext context, int index ){
                return Container(
                  width: double.infinity,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text(previousSearches[index], style: TextStyle(fontSize: 20),)),

                      IconButton(
                          onPressed: (){
                            setState(() {
                              previousSearches.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.cancel_outlined),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }

}
