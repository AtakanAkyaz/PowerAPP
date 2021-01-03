import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/first_screen.dart';

void main( ) => runApp( MyApp ());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Power App",
      home: Scaffold(
        body:FirstScreen()

      ),
    );
  }
}
