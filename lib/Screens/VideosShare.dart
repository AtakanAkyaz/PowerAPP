import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectse380/Screens/VideoUpload.dart';



class Videos_Share extends StatefulWidget {
  @override
  _Videos_ShareState createState() => _Videos_ShareState();
}

class _Videos_ShareState extends State<Videos_Share> {

  void _logoutUser(){

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CupertinoColors.inactiveGray,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Users Videos'),
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
                _logoutUser();
              },
            ),
          ],
        ),
      ),
      body: Container(

      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
            Navigator.push
              (
                context,
                MaterialPageRoute(builder:(context)
                {
                  return UploadVideoPage();
                })
            );
        },
        child: Icon(Icons.videocam),
        backgroundColor: Colors.green,
      ),
    );
  }
}
