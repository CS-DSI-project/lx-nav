import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
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

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('NavKMUTT'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 350.0,
              child: FlutterMap(
                  options:
                  MapOptions(center: LatLng(13.652094, 100.494061), zoom: 17),
                  layers: [
                    TileLayerOptions(
                      urlTemplate:
                      'https://api.mapbox.com/styles/v1/flukerbooker/ck8wr4jrm3k5g1io1dbeuun5n/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZmx1a2VyYm9va2VyIiwiYSI6ImNrOG43NnJ5YTA5YnIzZ21lMGUzdXFoMmMifQ.2a9t5SV3aSUqBm28Qc13bw',
                      additionalOptions: {
                        'accessToken : pk.eyJ1IjoiZmx1a2VyYm9va2VyIiwiYSI6ImNrOG43NnJ5YTA5YnIzZ21lMGUzdXFoMmMifQ.2a9t5SV3aSUqBm28Qc13bw'
                            'id': 'mapbox.mapbox-streets-v7'
                      },
                    )
                  ]
              ),
            ),
            Center(
                child: showButton(context)
            )
          ],
        )
    );
  }
}

Widget showButton(context) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        roomPageButton(context),
        errorPageButton(context),
        secureButton(context)
      ],
    ),
  );
}

Widget roomPageButton(context) {
  return RaisedButton(
    child: Text('Room Page'),
    onPressed: () {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Room());
      Navigator.of(context).push(materialPageRoute);
    },
  );
}

Widget errorPageButton(context) {
  return RaisedButton(
    child: Text('Error Page'),
    onPressed: () {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Error());
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
