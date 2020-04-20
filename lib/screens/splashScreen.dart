import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:lxnav/index.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Route<Object> get materialPageRoute => null;
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text('Welcome to NAVKMUTT',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Color.fromRGBO(255, 102, 0, 1.0)
          ),
        ),
        image: new Image.asset("images/logoSplashpng.png",height: 150,width: 150,),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: ()=>print("Flutter Egypt"),
        loaderColor: Colors.red
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Index();
  }
}