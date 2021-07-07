import 'package:flutter_app/object/sports.dart';

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
          "Swimming",
          "swimming",
          0xff263238
      ),
    ];
  }
}