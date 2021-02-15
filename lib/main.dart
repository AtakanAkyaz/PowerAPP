import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/first_screen.dart';
import 'package:firebase_core/firebase_core.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Power App",
      home: App(),
    );
  }
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot)
    {
      // Check for errors
      if (snapshot.hasError) {
        return Scaffold(
          body: Center(
            child: Text("ERROR"),
          ),
        );
      }

      // Once complete, show your application
      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
            resizeToAvoidBottomInset: false, body: FirstScreen());
      }

      // Otherwise, show something whilst waiting for initialization to complete
      return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ));
    },
    );
  }
}
