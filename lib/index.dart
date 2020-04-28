import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lxnav/screens/calendar.dart';
import 'package:lxnav/screens/homepage.dart';
import 'package:lxnav/screens/room/room.dart';
import 'package:lxnav/screens/map.dart';
class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: MyBottomNavigationBar()
      ),
      theme: ThemeData(
        primaryColor: Hexcolor('#ff6600'),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar>{
  int _selectedPage = 0;
  final _pageOptions = [
    Home(),
    MapSample(),
    Calendar(),
    Room()
  ];
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 2)]),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedPage,
            elevation: 20.0,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                title: Text('Map'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                title: Text('Calendar'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.room),
                title: Text('Room'),
              ),
            ],
          ),
        )
    );
  }
}

