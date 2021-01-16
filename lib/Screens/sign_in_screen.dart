import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectse380/main.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

TextEditingController emailController = new TextEditingController();
TextEditingController nameController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

class Sign_in extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: BackGround(),
    );
  }
}

class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.8), BlendMode.dstATop),
                image: AssetImage("images/FirstPage.jpg"),
                fit: BoxFit.cover),
          ),
        ),
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
            Sing_Up(),
          ],
        ),
      ],
    );
  }
}

class Sing_Up extends StatefulWidget {
  @override
  _Sing_UpState createState() => _Sing_UpState();
}

class _Sing_UpState extends State<Sing_Up> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: TextField(
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
                hintText: 'Enter your name'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: TextField(
            controller: emailController, // get email inside the box
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
                hintText: 'Enter your email'),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20, left: 20),
          child: TextField(
            controller: passwordController,// get password inside the box
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
              padding: EdgeInsets.only(left: 20),
              child: RaisedButton(
                  color: Colors.black54,
                  textColor: Colors.white,
                  onPressed: () {
                    _singIn();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  child: Text("Sign In")),
            ),
          ],
        ),
      ]),
    );
  }
}

void sign_up_powerapp(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text("Your Account Created"),
  );
  showDialog(context: context, builder: (BuildContext context) => alertDialog);
}

void _singIn() async {
  String _mail = emailController.text;
  String _password = passwordController.text;
  try {
    UserCredential _credential = await _auth.createUserWithEmailAndPassword(
        email: _mail, password: _password);
    User _newUSer = _credential.user;
    debugPrint("Your account is created");
    await _newUSer.sendEmailVerification();
    debugPrint("Your verificetion mail is sended");
  } catch (e) {
    debugPrint("**********( " + e.toString() + " )**********");
  }
}
