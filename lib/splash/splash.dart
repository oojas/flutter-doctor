import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:helper/animations/animations.dart';
import 'package:splashscreen/splashscreen.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  Widget build(BuildContext context) {
    //final width=MediaQuery.of(context).size.width;
    return SplashScreen(
      //loadingText: Text("HI"),
      seconds: 5,
      loaderColor: Colors.black,
      navigateAfterSeconds: animations(),
      image: Image.asset('lib/images/giphy (1).gif'),
      photoSize: 200,
      backgroundColor: Color(0xFF000000),
      title: Text(
        "Flutter Doctor",
        style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color(0xFF76FF03),
            fontStyle: FontStyle.normal),
        textAlign: TextAlign.center,
      ),
    loadingText: Text("Designed by Ojas Gupta\nDS Community App Team",style: TextStyle(color: Colors.amberAccent,fontSize: 17,fontWeight: FontWeight.bold),
    textAlign: TextAlign.justify,),

    );
  }
}
