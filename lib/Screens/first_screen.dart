import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectse380/Screens/courses.dart';

import 'sign_in_screen.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;


final uid = _auth.currentUser.uid;


bool _flag = false;
TextEditingController emailController = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _auth.signOut();
    return Stack(children: [
      BackGround(),
      Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 100, bottom: 10),
            child: Text("Power App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 75.0,
                    fontWeight: FontWeight.bold)),
          ),
          Login(),
        ],
      ),
    ]);
  }
}

class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.8), BlendMode.dstATop),
            image: AssetImage("images/FirstPage.jpg"),
            fit: BoxFit.cover),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          child: TextField(
            controller: emailController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                fillColor: Colors.black54,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24, width: 3.0),
                ),
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your mail'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: TextField(
            controller: _passwordController,
            style: TextStyle(color: Colors.white),
            obscuringCharacter: "*",
            obscureText: true,
            decoration: InputDecoration(
                fillColor: Colors.black54,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white24, width: 3.0),
                ),
                hintStyle: TextStyle(color: Colors.white),
                hintText: 'Enter your passsword'),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: RaisedButton(
                  color: Colors.black54,
                  textColor: Colors.white,
                  onPressed: () async {
                    if(_auth.currentUser != null){
                      await FirebaseAuth.instance.signOut();
                    }
                    await _loginIn();
                    if (_flag) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => courses_main()),
                      );
                    }
                  },
                  child: Text("Log In")),
            ),
            RaisedButton(
                color: Colors.black54,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sign_in()),
                  );
                },
                child: Text("Sign Up")),
          ],
        ),
      ]),
    );
  }
}

void _loginIn() async {
  await _auth.signOut();
  String _mail = emailController.text;
  String _password = _passwordController.text;

  try {
    var _userCredential = await _auth.signInWithEmailAndPassword(email: _mail, password: _password);
    if(_userCredential.user.emailVerified ){
      if(_auth.currentUser != null){
        _flag = true;
        debugPrint("********** Login in **********");
      }
      else{
        _flag =false;
      }
    }else{
      debugPrint("e mail is not verified");

    }
    
  }

  catch (error) {
    if (error.code == "user-not-found") {
      debugPrint("********** " + error.toString() + " **********");
      debugPrint("There is no such user");
    } else if (error.code == "wrong-password") {
      debugPrint("********** " + error.toString() + " **********");
      debugPrint("Wrong password");
    }
  }
  ;
}

/*
constraints: BoxConstraints.expand(width: 394,height: 737.3),
decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage("images/FirstPage.jpg"),
fit: BoxFit.cover
),
),


 */
