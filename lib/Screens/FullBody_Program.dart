import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectse380/Screens/courses.dart';

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;


final uid = _auth.currentUser.uid;


// ignore: camel_case_types
class Fullbody_Program extends StatefulWidget {
  @override
  _Fullbody_ProgramState createState() => _Fullbody_ProgramState();
}

class _Fullbody_ProgramState extends State<Fullbody_Program> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.inactiveGray,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Full Body Program'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(top: 20, left: 10),
          children: [
            ListTile(
              leading: Icon(Icons.accessibility_new),
              title: Text('Condition courses'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.library_add),
              title: Text('Create your own workout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Log out"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
          child: FutureBuilder(
            builder: (context, snapshot) {
              var showData = json.decode(snapshot.data.toString());
              return Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      left: 20,
                      right: 20,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 115,
                        color: Colors.black38,
                        child: Row(
                          children: <Widget>[
                            Container(
                              color: Colors.black38,
                              width: 200,
                              height: 200,
                              child: Image.asset(showData[0]["Path"]),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    showData[0]["VideoName"],
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0),
                                  ),
                                  Text("Set X Rep: " + showData[0]["setxrep"],
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 115,
                        color: Colors.black38,
                        child: Row(
                          children: <Widget>[
                            Container(
                              color: Colors.black38,
                              width: 200,
                              height: 200,
                              child: Image.asset(showData[1]["Path"]),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    showData[1]["VideoName"],
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  Text("Set X Rep: " + showData[1]["setxrep"],
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 115,
                        color: Colors.black38,
                        child: Row(
                          children: <Widget>[
                            Container(
                              color: Colors.black38,
                              width: 200,
                              height: 200,
                              child: Image.asset(showData[2]["Path"]),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    showData[2]["VideoName"],
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  Text("Set X Rep: " + showData[2]["setxrep"],
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 115,
                        color: Colors.black38,
                        child: Row(
                          children: <Widget>[
                            Container(
                              color: Colors.black38,
                              width: 200,
                              height: 200,
                              child: Image.asset(showData[3]["Path"]),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    showData[3]["VideoName"],
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  Text("Set X Rep: " + showData[3]["setxrep"],
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 115,
                        color: Colors.black38,
                        child: Row(
                          children: <Widget>[
                            Container(
                              color: Colors.black38,
                              width: 200,
                              height: 200,
                              child: Image.asset(showData[4]["Path"]),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    showData[4]["VideoName"],
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  Text("Set X Rep: " + showData[4]["setxrep"],
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            future: DefaultAssetBundle.of(context)
                .loadString(("video_json/video.json")),
          )),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Exercisevideos()),
          );
        },
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.green,
      ),
    );
  }
}

class Exercisevideos extends StatefulWidget {
  @override
  _ExercisevideosState createState() => _ExercisevideosState();
}

class _ExercisevideosState extends State<Exercisevideos> {
  var _count=0;

  Future<void> _incrementCounter() async {
    setState(() {
      if(_count<4){
        _count++;

      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => courses_main()),
        );
        finishedExercise("FullBodyProgram");
        _count = 0;
      }

    });}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.inactiveGray,
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        builder: (context, snapshot) {
          var showData = json.decode(snapshot.data.toString());
          return Column(
            children: [
              Container(
                width: 400,
                height: 400,
                child: Image.asset(showData[_count]["Path"]),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      showData[_count]["VideoName"],
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    SizedBox(width: 10),
                    Text("Set X Rep: " + showData[_count]["setxrep"],
                        style: TextStyle(color: Colors.red,fontSize: 20.0)),
                  ],
                ),
              ),
            RaisedButton(onPressed:(){
              _incrementCounter();
              debugPrint("$_count");
            })
          ],
          );
        },
          future: DefaultAssetBundle.of(context)
          .loadString(("video_json/video.json")),
      ),
    );

  }
}


Future<void> finishedExercise (String nameOfExercise) async {
  debugPrint("-------------------------$uid--------------------------------");
  DocumentReference docRef= _firestore.doc("Users/$uid");
  await docRef.collection("finishedExercise").add({"name": "$nameOfExercise" , "Date" : FieldValue.serverTimestamp()});
}





/*
 child: FutureBuilder(


           child: Column(
            children: [
              Container(
                color: Colors.black38,
                width: 200,
                height: 200,
                child: Image.asset(showData[4]["Path"]),
              ),
            ],
        )
                return ListView.builder(
                  itemCount: showData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(showData[index]["VideoName"]),
                        subtitle: Text("Set X Rep: " + showData[index]["setxrep"]),
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 80,
                            minHeight: 80,
                            maxWidth: 80,
                            minWidth: 80,
                          ),
                          child: Image.asset(showData[index]["Path"]),
                        ),
                      );
                  },
                );
*/
