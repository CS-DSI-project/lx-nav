import 'package:flutter/material.dart';

class Myroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter', home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 102, 0, 1.0),
        ),
        backgroundColor: Colors.white,
        body: Text('404'));
  }
}
