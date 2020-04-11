import 'package:flutter/material.dart';
import 'package:lxnav/error.dart';
import 'package:lxnav/roomPage.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to Flutter', home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  Route<Object> get materialPageRoute => null;
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
      MaterialPageRoute(builder: (BuildContext context) => Error());

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
      MaterialPageRoute(builder: (BuildContext context) => Error());

      Navigator.of(context).push(materialPageRoute);
    },
  );
}
