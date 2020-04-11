import 'package:flutter/material.dart';
import 'package:lxnav/screens/error.dart';
import 'package:lxnav/screens/roomPage.dart';


class HomePage extends StatelessWidget {
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
      body: Column(
        children: [showPic(), showButton(context)],
      ),
    );
  }
}

Widget showPic() {
  return Container(
    child: Image.asset('images/c2.png'),
  );
}

Widget showButton(context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      roomPageButton(context),
      errorPageButton(context)
    ],
  );
}

Widget errorPageButton(context) {
  return RaisedButton(
    child: Text('ERROR PAGE'),
    onPressed: () {
      print('You Click Sign Up');

      MaterialPageRoute materialPageRoute =
      MaterialPageRoute(builder: (BuildContext context) => MyError());

      Navigator.of(context).push(materialPageRoute);
    },
  );
}

Widget roomPageButton(context) {
  return RaisedButton(
    child: Text('Room Page'),
    onPressed: () {
      print('You Click Sign Up');

      MaterialPageRoute materialPageRoute =
      MaterialPageRoute(builder: (BuildContext context) => MyRoom());
      Navigator.of(context).push(materialPageRoute);
    },
  );
}
