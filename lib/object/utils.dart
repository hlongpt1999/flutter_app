import 'package:flutter_app/object/sports.dart';

import 'comment.dart';

class Utils{


  static List<Sports> getSport(){
    return [
      Sports(
        "Football",
        "football",
          0xffffc400
      ),

      Sports(
          "Volleyball",
          "volleyball",
          0xfffce4ec
      ),

      Sports(
          "Baseketball",
          "baseketball",
          0xff943290
      ),

      Sports(
          "Badminton",
          "badminton",
          0xff005599
      ),

      Sports(
          "Baseball",
          "baseball",
          0xff336699
      ),

      Sports(
          "Cycling",
          "cycling",
          0xff669911
      ),

      Sports(
          "Goft",
          "goft",
          0xff123456
      ),

      Sports(
          "Hockey",
          "hockey",
          0xff654321
      ),

      Sports(
          "Tennis",
          "tennis",
          0xff990044
      ),

    ];
  }
/*
  static List<Comment> getComment(){
    return [
      Comment(
          "Very best, haha",
          "10 mins ago",
          "1"
      ),

      Comment(
          "Great, I like it",
          "5 mins ago",
          "2"
      ),

      Comment(
          "Good morning",
          "34 mins ago",
          "3"
      ),

      Comment(
          "I like soccer, ",
          "5 mins ago",
          "4"
      ),

      Comment(
          "I don't like sporttttttttttt, hmmmmmmmmmmmmmmmmmmm",
          "56 mins ago",
          "5"
      ),

      Comment(
          "Vietnam ♥♥♥",
          "77 mins ago",
          "6"
      ),
    ];
  }
*/
  Utils();
}