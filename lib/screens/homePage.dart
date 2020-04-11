import 'package:flutter/material.dart';
import 'package:lxnav/screens/error.dart';
import 'package:lxnav/screens/roomPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to Flutter',
        home: Home(),
        theme: ThemeData(
          primarySwatch: Colors.orange,
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
    children: <Widget>[roomPageButton(context), errorPageButton(context)],
  );
}

Widget errorPageButton(context) {
  return RaisedButton(
    child: Text('ERROR PAGE'),
    onPressed: () {
      MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Error());
      Navigator.of(context).push(materialPageRoute);
    },
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
