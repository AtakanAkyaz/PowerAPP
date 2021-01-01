import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main( ) => runApp( MyApp ());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Power App",
      home: Scaffold(
        body: Material(
          child:Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/FirstPage.jpg"),
                      fit: BoxFit.cover
                  )
            ),
              child:Center(
               child: Column(
                children: <Widget>[
                  Text(
                      "ATAKAN 01", textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 45, color: Colors.white, height: 5
                      )
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
