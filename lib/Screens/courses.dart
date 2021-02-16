import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projectse380/Screens/FullBody_Program.dart';
import 'package:projectse380/Screens/VideosShare.dart';
import 'package:projectse380/Screens/listitem.dart';
import 'package:projectse380/main.dart';
import 'package:projectse380/Screens/first_screen.dart';


FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _firestore = FirebaseFirestore.instance;
final uid = _auth.currentUser.uid;
User user = _auth.currentUser;




// ignore: camel_case_types
class courses_main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: PowerApp(),

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
    "https://content.active.com/Assets/Active.com+Content+Site+Digital+Assets/Fitness/580x350/Push-Up.jpg",
    "https://images.unsplash.com/photo-1534258936925-c58bed479fcb?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1489&q=80",
    "https://images.unsplash.com/photo-1518611012118-696072aa579a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
    "https://www.mensjournal.com/wp-content/uploads/mf/cardio-builds-muscle-main_0.jpg?w=1200&h=630&crop=1&quality=86&strip=all",
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
            floating:false,
            title:Text("PowerApp",style: TextStyle(color:Colors.white)
            ),
              centerTitle:true,
            backgroundColor: Colors.black,
            toolbarHeight:80.0,
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
                onPressed: () {
                },
                icon: Icon(Icons.settings),
              ),
            ]
          )
        ];
      },
      body: SingleChildScrollView(


        child: Padding(

          padding:
            const EdgeInsets.only(top:20.0,right:20.0,left:20.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,

                  ),
                ),


              Text("Top Trends",
                  style:TextStyle(
                    color:Colors.black,
                    fontSize:24.0,
                    fontWeight: FontWeight.w800,
                  ),
              ),
              SizedBox(height: 150.0,
                child: InkWell(child: Container(
                  decoration:BoxDecoration(

                  ),
                  child:Align(child: listItem(trainingImage[0], "Full Body Program", 53, 30),
                    alignment: Alignment(0.1,0.1),
                  ),


                ),
                  onTap:(){
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => Fullbody_Program()),
                    );


                  },
                ),
              ),
              SizedBox(height: 150.0,
                child: InkWell(child: Container(
                  decoration:BoxDecoration(

                  ),
                  child:Align(child: listItem(trainingImage[1], "Crossfit Program", 30, 10),
                    alignment: Alignment(0.1,0.1),
                  ),


                ),
                  onTap:(){
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => Fullbody_Program()),
                    );


                  },
                ),
              ),
              SizedBox(height: 150.0,
                child: InkWell(child: Container(
                  decoration:BoxDecoration(

                  ),
                  child:Align(child: listItem(trainingImage[2], "Yoga Program", 42, 30),
                    alignment: Alignment(0.1,0.1),
                  ),


                ),
                  onTap:(){
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => Fullbody_Program()),
                    );


                  },
                ),
              ),
              SizedBox(height: 150.0,
                child: InkWell(child: Container(
                  decoration:BoxDecoration(

                  ),
                  child:Align(child: listItem(trainingImage[3], "Cardio Program", 55, 20),
                    alignment: Alignment(0.1,0.1),
                  ),


                ),
                  onTap:(){
                    Navigator.push(
                      context,MaterialPageRoute(builder: (context) => Fullbody_Program()),
                    );


                  },
                ),
              ),




            ],
          ),
        )
      )

    ),
      drawer: Drawer(

        child: ListView(

          padding: EdgeInsets.only(top:20,left:10),
          children: [

            ListTile(

              leading:Icon(Icons.account_box) ,
              title: Text('Welcome $name'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:Icon(Icons.accessibility_new) ,
              title: Text('Condition courses'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Fullbody Program'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Fullbody_Program()),
                );
              },
            ),
            ListTile(
              leading:Icon(Icons.slideshow),
              title: Text('Share Videos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Videos_Share()),
                );
              },
            ),
            ListTile(
              leading:Icon(Icons.library_add) ,
              title: Text('Create your own workout'),
              onTap: ()  {
                Navigator.pop(context);
              },
            ),
            ListTile (
              leading: Icon(Icons.exit_to_app),

              title:Text("Log out"),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
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
Future<void> a () async {


  debugPrint("-----------------------$name");

  FirebaseFirestore.instance.collection("Users/$uid/finishedExercise").get().then((QuerySnapshot querySnapshot) => {
    querySnapshot.docs.forEach((doc) {debugPrint(doc["Date"].toString() );})
  });

}
