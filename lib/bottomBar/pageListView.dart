import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/object/sports.dart';
import 'package:flutter_app/object/utils.dart';

class pageListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _pageListViewState();
  }

}

class _pageListViewState extends State<pageListView>{
  var _listViewText = "Click item text";
  List<Sports> sports = Utils.getSport();
  ScrollController _scrollController = new ScrollController();


  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(_listViewText,
              style: TextStyle(fontSize: 15),),
          ),


          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: sports.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: (){
                  setState(() {
                    _listViewText = sports[index].name;
                  });
                },
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 200,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset('assets/images/'+sports[index].imgname+'.jpg',
                              fit:  BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          left: 10,
                          top: 10,
                          child: Row(
                            children: <Widget>[
                              ClipOval(
                                child: Container(
                                  color: Color(sports[index].color),
                                  padding: EdgeInsets.all(10),
                                  child: FlutterLogo(),
                                ),
                              ),

                              SizedBox(width: 10,),
                              Text(
                                sports[index].name,
                                style: TextStyle(
                                  color: Color(sports[index].color),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }  //     style: TextStyle(color: Colors.black,

  void _scrollListener(){
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
    !_scrollController.position.outOfRange){
      print('i am at the bottom!');
      setState(() {
        _listViewText='i am at the bottom!';
      });
    }

    if (_scrollController.offset <= _scrollController.position.minScrollExtent &&
    !_scrollController.position.outOfRange) {
      print('i am at the top!');
      setState(() {
        _listViewText='i am at the top!';
      });
    }

  }

}