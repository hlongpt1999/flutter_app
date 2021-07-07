import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/object/sports.dart';
import 'package:flutter_app/object/utils.dart';

class HomePage extends StatelessWidget{

  List<Sports> sports = Utils.getSport();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "LIST BUILD",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            
            Expanded(
                child: ListView.builder(
                  itemCount: sports.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
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

                    );
                  },
                ),
            ),
            
          ],
        ),
      ),
    );
  }

}