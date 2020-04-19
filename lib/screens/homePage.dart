import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:lxnav/screens/error.dart';
import 'package:lxnav/screens/roomPage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lxnav/secureFile.dart';
import 'package:lxnav/screens/ggMap.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Home(),
      theme: ThemeData(
        primaryColor: Hexcolor('#f98113'),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedPage = 0;
  final _pageOptions = [
    Text('Home'),
    Text('Search'),
    MapSample(),
    Text('Contact')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NavKMUTT'),
      ),
      body: SafeArea(
        child: _pageOptions[_selectedPage],
      ),
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
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('Map'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              title: Text('Contact'),
            ),
          ],
        ),
      ),
    );
  }
}

//Widget showButton(context) {
//  return Container(
//      child: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            roomPageButton(context),
//            errorPageButton(context),
//        ],
//      ),
//    ),
//  );
//}
//
//Widget roomPageButton(context) {
//  return RaisedButton(
//    child: Text('Room Page'),
//    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//    padding: const EdgeInsets.all(20.0),
//    onPressed: () {
//      MaterialPageRoute materialPageRoute =
//          MaterialPageRoute(builder: (BuildContext context) => Room());
//      Navigator.of(context).push(materialPageRoute);
//    },
//  );
//}
//
//Widget errorPageButton(context) {
//  return RaisedButton(
//    child: Text('Error Page'),
//    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//    padding: const EdgeInsets.all(20.0),
//    onPressed: () {
//      MaterialPageRoute materialPageRoute =
//          MaterialPageRoute(builder: (BuildContext context) => Error());
//      Navigator.of(context).push(materialPageRoute);
//    },
//  );
//}
//
//Widget secureButton(context) {
//  return RaisedButton(
//    child: Text('Secure Do not touch it do not work', softWrap: true),
//    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//    padding: const EdgeInsets.all(20.0),
//    onPressed: () {
////      MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => ItemsWidget());
////      Navigator.of(context).push(materialPageRoute);
//    },
//  );
//}
