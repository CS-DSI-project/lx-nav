import 'package:flutter/material.dart';
import 'package:lxnav/screens/splashScreen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:async';
Future main() async{
  await DotEnv().load('.env');
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}
