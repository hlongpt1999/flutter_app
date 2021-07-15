import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/pageSharedPreferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/pageToDo.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() =>runApp(MyLogin());

class MyLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Replace the 3 second delay with your initialization code:
      future: Future.delayed(Duration(seconds: 4)),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(home: Splash());
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            home: LoginApp(),
          );
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.house_outlined,
              color: Colors.white,
                size: MediaQuery.of(context).size.width *0.4,
              ),

              SizedBox(height: 5,),

              Text("WELCOME TO FLUTTER APP",
                style: TextStyle(fontSize: MediaQuery.of(context).size.width *0.06,
                    fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

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
  var _usernameInvalid = false;
  var _passwordInvalid = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Container(
              height: 40,
              child: RaisedButton(
                onPressed: (){
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>pageSharedPreferences()));
                  });
                },
                color: Colors.yellow,
                child: Text("Shared References", style: TextStyle(color: Colors.black),),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.orangeAccent,
                  ),
                ),
              ),
            ),

            SizedBox(height: 15,),

            FloatingActionButton.extended(
              onPressed: (){
                setState(() {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HomePage()));
                });
              },
              icon: FlutterLogo(),
              label: Text("Home"),
              backgroundColor: Colors.pink,
            ),



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
              "HELLO,\nFIRST FLUTTER APP!\nPress sign in to Stream demo (not user/pass)",
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
                  errorText: _usernameInvalid ? _usernameError : null,
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
                      errorText: _passwordInvalid ? _passwordError : null,
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
                  child: Text("SIGN IN STREAM", style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              ),
            ),

          ],
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
        _usernameInvalid = false;
      else _usernameInvalid =true;

      if (_password.text.compareTo("admin")==0)
        _passwordInvalid = false;
      else _passwordInvalid =true;

      if(!_usernameInvalid && !_passwordInvalid) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyApp()));
      }

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyApp()));


    });
  }

}