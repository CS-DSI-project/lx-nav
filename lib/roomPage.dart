import 'package:flutter/material.dart';
class RoomPage extends StatefulWidget {
  @override
  _RoomPageState createState() => _RoomPageState();
}
class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 102, 0, 1.0),
        title: Text('Room'),
      ),
      body: Center(child: Text('Test')),);


  }
}
