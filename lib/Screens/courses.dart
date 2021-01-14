import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class courses_main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PowerApp(),
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
class PowerApp extends StatefulWidget{
  @override
  _PowerAppState createState() => _PowerAppState();
}
class _PowerAppState extends State<PowerApp>{
  String img_Header =
      "https://images.unsplash.com/photo-1517836357463-d25dfeac3438?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80";
  List<String> trainingImage= [
    "https://images.unsplash.com/photo-1526506118085-60ce8714f8c5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"
    "https://images.unsplash.com/photo-1534258936925-c58bed479fcb?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1489&q=80"
    "https://images.unsplash.com/photo-1518611012118-696072aa579a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body : NestedScrollView(

      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return<Widget>[
          SliverAppBar(
    expandedHeight: 300.0,
            pinned:true,
            floating:true,
            title:Text("PowerApp",style: TextStyle(color:Colors.white)
            ),
              centerTitle:true,
            backgroundColor: Colors.black,
            toolbarHeight:80.0,
            leading:IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(img_Header,fit: BoxFit.cover,
                color: Color(0xaa212121),
                colorBlendMode:BlendMode.darken,
              ),
        ),
            bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.only(bottom:24.0, left:12.0, right: 12.0),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical:0.0,horizontal: 24.0
                    ),
                    hintText: "Search for a training Program...",
                    prefixIcon: Icon(
                      Icons.search,
                      color:Colors.black,
                    )
                  )
                ),
              ), preferredSize: Size.fromHeight((80.0)),
        ),
            actions:[
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
              ),
            ]
          )
        ];
      },
      //Build app Body dk 8:58---------------------------------------------------------------------------
      body: Center(child: Text("Hello")),
    ),
    );
  }
}