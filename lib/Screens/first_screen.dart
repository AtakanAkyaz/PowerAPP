import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class FirstScreen  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Stack(

      children:[
        BackGround(),
        Column(children: [
          Container(
            alignment: Alignment.center,
              padding: EdgeInsets.only(top:100,bottom: 20),
              child: Text("Power App",
                  style: TextStyle(color: Colors.red, fontSize: 75.0, fontWeight: FontWeight.bold)
              ),
            ),
          Login(),
        ],
        ),
      ]
    );

  }
}

class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                  image: AssetImage("images/FirstPage.jpg"),
                  fit: BoxFit.cover
              ),
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
          child: Column(
            children: <Widget>[
              TextField(
                maxLength: 10,
                cursorColor:Colors.red,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your username'
                ),
              ),

              TextField(
                maxLength: 10,
                obscuringCharacter: "*",
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(20.0),
                    labelText: 'Enter your password'
                ),
              ),
             


            ]
          ),
       );
  }
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
