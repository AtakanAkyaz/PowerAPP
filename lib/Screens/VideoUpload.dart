import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

import 'package:projectse380/Screens/VideosShare.dart';







class UploadVideoPage extends StatefulWidget {
  @override
  _UploadVideoPageState createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  File videoFile;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  File sampleVideo;
  String _myvalue;
  final formKey = new GlobalKey<FormState>();


  Future getVideo() async {
    Future<File> _videoFile =
    ImagePicker.pickVideo(source: ImageSource.gallery);
    _videoFile.then((file) async {
      setState(() {
        videoFile = file;
        _controller = VideoPlayerController.file(videoFile);

        // Initialize the controller and store the Future for later use.
        _initializeVideoPlayerFuture = _controller.initialize();

        // Use the controller to loop the video.
        _controller.setLooping(true);
      });
    });
  }





  Future getImage() async{
    final tempVideo = await ImagePicker().getVideo(source:ImageSource.gallery);


    setState(() {
      //sampleVideo = tempVideo ;
      if (tempVideo != null) {
        sampleVideo = File(tempVideo.path);
      } else {
        print('No image selected.');
      }
    }
    );
  }

  bool validateAndSave(){
    final form = formKey.currentState;

    if(form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: videoFile == null? Text("Select an Video"): enableUpload(),

      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: getVideo,
        tooltip: 'Add Video',

        child: Icon(Icons.videocam),
        backgroundColor: Colors.green,
      ),
    );
  }



  Widget enableUpload()
  {
    return  Container
      (
        child: Form(
            key:formKey,
            child:Column(

              children: <Widget>[

               Image.file(videoFile, height: 310.0,width:600.0 ,),

                SizedBox(height: 15.0,),

                TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),

                    validator:(value){
                      return value.isEmpty ? 'Blod Description is required': null;
                    },

                    onSaved:(value){
                      return  _myvalue = value;
                    }
                ),

                SizedBox(height: 15.0,),

                RaisedButton(
                  elevation: 10.0,
                  child: Text("Add a New Post"),
                  textColor: Colors.white,
                  color:Colors.pink,

                  onPressed: validateAndSave,
                )
              ],

            )
        )
    );
  }
}




/*
class UploadVideoPage extends StatefulWidget {
  @override
  _UploadVideoPageState createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {

  File sampleVideo;
  String _myvalue;
  final formKey = new GlobalKey<FormState>();




  Future getImage() async{
    final tempVideo = await ImagePicker().getImage(source:ImageSource.camera);

    setState(() {
      //sampleVideo = tempVideo ;
      if (tempVideo != null) {
        sampleVideo = File(tempVideo.path);
      } else {
        print('No image selected.');
      }
    }
    );
  }

  bool validateAndSave(){
    final form = formKey.currentState;

    if(form.validate()){
      form.save();
      return true;
    }
    else{
      return false;
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: sampleVideo == null? Text("Select an Video"): enableUpload(),
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: getImage,
        tooltip: 'Add Video',

        child: Icon(Icons.videocam),
        backgroundColor: Colors.green,
      ),
    );
  }



  Widget enableUpload()
  {
    return  Container
      (
       child: Form(
           key:formKey,
           child:Column(
             children: <Widget>[
               Image.file(sampleVideo, height: 310.0,width:600.0 ,),

               SizedBox(height: 15.0,),

               TextFormField(
                   decoration: InputDecoration(labelText: 'Description'),

                   validator:(value){
                     return value.isEmpty ? 'Blod Description is required': null;
                   },

                   onSaved:(value){
                     return  _myvalue = value;
                   }
               ),

               SizedBox(height: 15.0,),

               RaisedButton(
                 elevation: 10.0,
                 child: Text("Add a New Post"),
                 textColor: Colors.white,
                 color:Colors.pink,

                 onPressed: validateAndSave,
               )
             ],

           )
       )
      );
  }
}


 */