import 'package:flutter/material.dart';

class FirstScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/FirstPage.jpg"),
            fit: BoxFit.cover
          )
        ),

      child:Container( alignment: Alignment.center,
          child: Text("Power App",
              style: TextStyle(color: Colors.red, fontSize: 75.0, fontWeight: FontWeight.bold)
          )
        ),
      ),
    );
  }
}
