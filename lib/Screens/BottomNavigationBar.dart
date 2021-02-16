import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'MyVideo.dart';


class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _currentIndex =0 ;
  GlobalKey _bottomNavigationKey= GlobalKey();
  PageController _pageController;

  @override
  void initState() {
    _pageController=PageController();
  }


  @override
  void dispose() {
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Users Videos'),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        color: Colors.black,
        backgroundColor: Colors.grey,
        index: _currentIndex,
        key: _bottomNavigationKey,
        items:<Widget>[

          Icon(Icons.video_library,size:30,color:Colors.white),

        ],
          onTap: (index){
            setState(() {
          _currentIndex = index;
          _pageController.jumpToPage(index);
            });
          },
      ),
      body:SizedBox.expand(
        child:PageView(
          controller: _pageController,
          onPageChanged: (index){
            setState(() => _currentIndex =index);
          },
          children: <Widget>[
            MyVideo(),
          ],
        )
      )
    );
  }
}
