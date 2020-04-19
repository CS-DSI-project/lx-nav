import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:lxnav/screens/homePage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
Future main() async{
  await DotEnv().load('.env');
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Route<Object> get materialPageRoute => null;
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        seconds: 1,
        navigateAfterSeconds: new AfterSplash(),
        title: new Text('Welcome In SplashScreen',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            color: Color.fromRGBO(255, 102, 0, 1.0)
          ),
        ),
        image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
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
    return HomePage();
  }
}
