import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/object/photo.dart';
import 'package:flutter_app/object/sports.dart';
import 'package:flutter_app/object/utils.dart';
import 'package:http/http.dart' as http;

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}


class commentList extends StatelessWidget {
  // final String title;
  //
  // pageNestedListView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PhotosList(photos: snapshot.data!)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key? key, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 25, // Api chứa nhiều, load chậm
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              height: 70,
              padding: EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(photos[index].thumbnailUrl),
                    radius: 25,
                  ),

                  const SizedBox(width: 12),

                  Flexible(
                    child: Column(
                      children:<Widget> [
                        Container(
                            alignment: Alignment.topLeft,
                            child: Text("ID: "+photos[index].id.toString())),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(photos[index].title,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {// 6
            return const SizedBox(height: 16);
          }),
    );
  }

}

class HorListView extends StatelessWidget{
  List<Sports> sports = Utils.getSport();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: sports.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/'+sports[index].imgname+'.jpg', width: 300, height: 300, fit: BoxFit.cover,)),
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
        );
      },
    );
  }
}

class pageNestedListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          const SizedBox(height: 16),
          Container(
              width: double.infinity,
              height: 380,
              child: HorListView()
          ),
          const SizedBox(height: 16),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Comment",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
          Column(
            children: [
              commentList(),
            ],
          ),
        ],
      ),
    );
  }

}