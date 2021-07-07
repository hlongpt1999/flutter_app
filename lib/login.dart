import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() =>runApp(LoginApp());

class LoginApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginAppState();
  }
}

class _LoginAppState extends State<LoginApp>{
  bool _isShowPass = false;
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  var _usernameError = "Wrong Username";
  var _passwordError = "Wrong Password";
  var _username_invalid = false;
  var _password_invalid = false;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
         body: Container(
           padding: EdgeInsets.all(20),
           constraints: BoxConstraints.expand(),
           color: Colors.white,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.fromLTRB(0,20,0,40),
                 child: Container(
                   width: 70,
                   padding: EdgeInsets.all(15),
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.black12
                   ),
                   child: FlutterLogo(),
                 ),
               ),

               Text(
                 "HELLO,\nFIRST FLUTTER APP!",
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold,
                   color: Colors.black
                 ),
               ),

//USER NAME
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: TextField(
                   controller: _username,
                   style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                   decoration: InputDecoration(
                     labelText: "Username",
                     errorText: _username_invalid ? _usernameError : null,
                     labelStyle: TextStyle(color: Colors.purple, fontSize: 15),
                   ),
                 ),
               ),

//PASSWORD
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: Stack(
                   alignment: AlignmentDirectional.centerEnd,
                   children: <Widget>[
                     TextField(
                       controller: _password,
                       style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                       obscureText: !_isShowPass,
                       decoration: InputDecoration(
                         labelText: "Password",
                         labelStyle: TextStyle(color: Colors.purple, fontSize: 15),
                         errorText: _password_invalid ? _passwordError : null,
                       ),
                     ),

                     GestureDetector(
                       onTap: onShow_HideClick,
                       child: Text(
                         _isShowPass? "Hide" : "Show",
                         style: TextStyle(
                           color: Colors.blue,
                           fontSize: 15,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                   ],
                 ),
               ),

               Padding(
                 padding: const EdgeInsets.only(top: 20, bottom: 20),
                 child: SizedBox(
                   width: double.infinity,
                   height: 50,
                   child: RaisedButton(
                     color: Colors.blue,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.only(topLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                     ),
                     onPressed: onSignInClick,
                     child: Text("SIGN IN", style: TextStyle(color: Colors.white, fontSize: 20),),
                   ),
                 ),
               ),

             ],
           ),
         ),
       ),
    );
  }

  void onShow_HideClick(){
    setState(() {
      _isShowPass=!_isShowPass;
    });
  }

  void onSignInClick(){
    setState(() {
      if (_username.text.compareTo("admin")==0)
        _username_invalid = false;
      else _username_invalid =true;

      if (_password.text.compareTo("admin")==0)
        _password_invalid = false;
      else _password_invalid =true;
    });
  }

}