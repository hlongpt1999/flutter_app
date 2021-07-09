import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/object/sports.dart';
import 'package:flutter_app/object/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class pageGridView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _gridViewState();
  }
}

class _gridViewState extends State<pageGridView>{
  List<Sports> sports = Utils.getSport();

  var _gridViewText = "Click item text";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(_gridViewText,
            style: TextStyle(fontSize: 15),),
          ),

          Expanded(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: List.generate(
                  sports.length,
                      (index) {
                    return GestureDetector(
                      onTap:(){
                        setState(() {
                          // Fluttertoast.showToast(msg: sports[index].name);
                          _gridViewText = sports[index].name;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(sports[index].color),
                            width: 3,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: ClipOval(
                                child: Image.asset('assets/images/'+sports[index].imgname+'.jpg',
                                  fit: BoxFit.cover, width: 110, height: 110,),
                              ),
                            ),
                            SizedBox(height: 3,),
                            Text(
                              sports[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }


}