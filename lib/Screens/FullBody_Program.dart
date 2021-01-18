import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Fullbody_Program extends StatefulWidget {
  @override
  _Fullbody_ProgramState createState() => _Fullbody_ProgramState();
}

class _Fullbody_ProgramState extends State<Fullbody_Program> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
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

            return Container(
              child: Column(children: [
                for(var i in showData.length)Text(i.snapshot.data.toString())

              ]
              ),
            );

            /*
          return ListView.builder(
            itemCount: showData.length,
              itemBuilder: (BuildContext context, int index){
              return

                ListTile(
                //title: Text(showData[0]["VideoName"]),
                //subtitle: Text("Set X Rep: "+showData[0]["setxrep"]),
                leading:ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 1200,
                    minHeight: 1200,
                    maxWidth: 1200,
                    minWidth: 1200,
                  ),
                  child: Image.asset(showData[0]["Path"]),
                ),
              );
              },
          );
          */
          },
          future: DefaultAssetBundle.of(context)
              .loadString(("video_json/video.json")),
        )));
  }
}
