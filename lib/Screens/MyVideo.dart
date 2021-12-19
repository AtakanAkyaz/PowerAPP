import 'package:chewie/chewie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:video_player/video_player.dart';



class MyVideo extends StatefulWidget {
  @override
  _MyVideoState createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {

  final fb = FirebaseDatabase.instance.reference().child("Videos Link");
  List<String> itemList = new List();
  FirebaseAuth mAuth = FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          physics: new BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListView.separated(
                shrinkWrap: true,
                cacheExtent: 1000,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                key: PageStorageKey(widget.key),
                addAutomaticKeepAlives: true,
                itemCount: itemList.isEmpty ? 0 : itemList.length,
                itemBuilder: (BuildContext context, int index) =>
                    Container(
                      width: double.infinity,
                      height: 800,
                      alignment: Alignment.center,
                      child: Container(
                          key: new PageStorageKey(
                            "keydata$index",
                          ),
                          child: VideoWidget(
                              play: true,
                              url: itemList[index]
                          )
                      ),
                    ),
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          uploadToStorage();
        },
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }

 Future uploadToStorage() async{
    var uuid=Uuid();
    dynamic id = uuid.v1();
    try{

      mAuth.signInAnonymously().then((value) async{
        FirebaseStorage storage = FirebaseStorage.instance;
      final file = await ImagePicker.pickVideo(source: ImageSource.gallery);
      Reference ref = storage.ref().child("video").child(id);
      UploadTask uploadTask = ref.putFile(file);
      var storageTaskSnapshot = await uploadTask;
      var downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
      final String url = downloadUrl.toString();
      fb.child(id).set({
        'id':id,
        'link':url,
      }).then((value) {
        print("Done");
      });
      });
    }catch(error){
        print(error);
    }
 }
 @override
  void initState(){
    fb.once().then((DataSnapshot snap){
      print(snap);
      var data = snap.value;
      print(data);
      itemList.clear();
      data.forEach((key,value){
        itemList.add(value['link']);
      });
      setState(() {

      });
    });

 }

}

class VideoWidget extends StatefulWidget {
  final bool play;
  final String url;

  const VideoWidget({Key key, @required this.url, @required this.play})
      : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {


  VideoPlayerController videoPlayerController;
  Future<void> _initializeVideoPlayerFuture;
  @override
  void initState(){
    super.initState();
    videoPlayerController = new VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = videoPlayerController.initialize().then((_){
        setState(() {

        });
    });
  }
  @override
  void dispose(){
    videoPlayerController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:_initializeVideoPlayerFuture ,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Container(
              child: Card(
                key: PageStorageKey(widget.url),
                elevation: 3.0,
                child:Column(
                  children:<Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child:Chewie(
                          key: PageStorageKey(widget.url),
                          controller: ChewieController(
                            videoPlayerController: videoPlayerController,

                            autoInitialize: true,
                            looping: false,
                            autoPlay: false,

                            errorBuilder: (context,errorMessage){
                              return Center(
                                child: Text(
                                  errorMessage,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }
                          ),
                        )
                      )
                  ]
                )
              ),
            );
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

