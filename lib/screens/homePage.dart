import 'package:flutter/material.dart';
import 'package:lxnav/screens/error.dart';
import 'package:lxnav/screens/roomPage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lxnav/secureFile.dart';
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

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NavKMUTT'),
      ),
      body: Center(
        child: showButton(context),
      ),
    );
  }
}

Widget showButton(context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[roomPageButton(context), errorPageButton(context),secureButton(context)],
  );
}

Widget roomPageButton(context) {
  return RaisedButton(
    child: Text('Room Page'),
    onPressed: () {
      MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Room());
      Navigator.of(context).push(materialPageRoute);
    },
  );
}

Widget errorPageButton(context) {
  return RaisedButton(
    child: Text('Error Page'),
    onPressed: () {
      MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Error());
      Navigator.of(context).push(materialPageRoute);
    },
  );
}
Widget secureButton(context) {
  return RaisedButton(
    child: Text('Secure Do not touch it do not work'),
    onPressed: () {
//      MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => ItemsWidget());
//      Navigator.of(context).push(materialPageRoute);
    },
  );
}