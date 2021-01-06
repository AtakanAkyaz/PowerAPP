import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class courses_main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Courses'),

      ),
      body:BackGround(),
      drawer: Drawer(
       child: ListView(

           padding: EdgeInsets.only(top:20,left:10),
           children: [
             ListTile(
              leading:Icon(Icons.accessibility_new) ,
               title: Text('Condition courses'),
               onTap: () {
                 Navigator.pop(context);
               },
             ),
             ListTile(
               leading:Icon(Icons.library_add) ,
               title: Text('Create your own workout'),
               onTap: () {
                 Navigator.pop(context);
               },
             ),
             ListTile(
               leading: Icon(Icons.exit_to_app),
               title:Text("Log out"),
               onTap: () {
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => MyApp()),
                 );
               },
             ),
           ],
       ),
      ),
    );
  }
}


class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                image: AssetImage("images/FirstPage.jpg"),
                fit: BoxFit.cover
            ),
          ),
        ),
      ]
    );
  }
}