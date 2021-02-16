import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;


final uid = _auth.currentUser.uid;
var asddd ;

class exercise extends StatefulWidget {
  @override
  _exerciseState createState() => _exerciseState();
}

class _exerciseState extends State<exercise> {
  @override
  Widget build(BuildContext context) {
    asd();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Finished Exercises"),
      ),
      );
  }
}


void asd(){
  FirebaseFirestore.instance
      .collection('Users/$uid/finishedExercise')
      .get()
      .then((QuerySnapshot querySnapshot) => {
    querySnapshot.docs.forEach((doc) {
      debugPrint(doc["name"]);
      debugPrint(doc["Date"].toString());
    }),
  });
}


