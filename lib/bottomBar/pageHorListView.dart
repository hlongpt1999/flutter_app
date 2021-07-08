import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/object/sports.dart';
import 'package:flutter_app/object/utils.dart';


class pageHorListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _pageHorListViewState();
  }

}

class _pageHorListViewState extends State<pageHorListView>{
  var _listViewText = "Click item text";
  List<Sports> sports = Utils.getSport();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(_listViewText,
              style: TextStyle(fontSize: 15),),
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sports.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      _listViewText = sports[index].name;
                    });
                  },
                  child: SizedBox(
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset('assets/images/'+sports[index].imgname+'.jpg', width: 100, height: 150, fit: BoxFit.cover,)),
                        Container(
                          margin: EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            children: [
                              Text(
                                "Name: " + sports[index].name,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                "Color: " + sports[index].color.toString(),
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          color: Color(sports[index].color),
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
  }


}