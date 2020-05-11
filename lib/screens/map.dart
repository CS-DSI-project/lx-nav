import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

const double CAMERA_ZOOM = 18;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 270;
const LatLng SOURCE_LOCATION = LatLng(13.652021, 100.493701);
const LatLng DEST_LOCATION = LatLng(13.652021, 100.493701);
var apiKey = DotEnv().env['gg'];
bool navi = false;

const timeout = const Duration(seconds: 3);

class MapSample extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
// for my drawn routes on the map
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;

// for my custom marker pins
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
// the user's initial location and current location
// as it moves
  LocationData currentLocation;
// a reference to the destination location
  LocationData destinationLocation;
// wrapper around the location API
  Location location;
  @override
  void initState() {
    location = new Location();
    super.initState();

    // create an instance of Location
    location = Location();
    polylinePoints = PolylinePoints();

    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    if (navi == true) {
      location.onLocationChanged.listen((LocationData cLoc) {
        // cLoc contains the lat and long of the
        // current user's position in real time,
        // so we're holding on to it
        currentLocation = cLoc;
        updatePinOnMap();
        print(navi);
      });
    }
    // set custom marker pins
    setSourceAndDestinationIcons();
    // set the initial location
    setInitialLocation();
  }

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'images/man1.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), 'images/track.png');
  }

  void setInitialLocation() async {
    // set the initial location by pulling the user's
    // current location from the location's getLocation()
    currentLocation = await location.getLocation();

    // hard-coded destination for this example
    destinationLocation = LocationData.fromMap({
      "latitude": DEST_LOCATION.latitude,
      "longitude": DEST_LOCATION.longitude
    });
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
        zoom: 15, tilt: 0, bearing: 0, target: LatLng(13.652021, 100.493701));
    if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: CAMERA_ZOOM,
          tilt: CAMERA_TILT,
          bearing: CAMERA_BEARING);
    }
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GoogleMap(
                myLocationEnabled: true,
                compassEnabled: true,
                tiltGesturesEnabled: true,
                minMaxZoomPreference: MinMaxZoomPreference(14, 18),
                markers: _markers,
                polylines: _polylines,
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  // my map has completed being created;
                  // i'm ready to show the pins on the map
                  showPinsOnMap();
                }),
          ],
        ),
      ),
      floatingActionButton: Align(
          child: FloatingActionButton(
            onPressed: () {
              _navigate();
            },
            child: Icon(Icons.directions),
          ),
          alignment: Alignment(1.07, 0.7)),
    );
  }

  void _navigate() {
    navi = !navi;
    setState(() {
      location.onLocationChanged.listen((LocationData cLoc) {
        // cLoc contains the lat and long of the
        // current user's position in real time,
        // so we're holding on to it
        currentLocation = cLoc;
        updatePinOnMap();
        setPolylines();
        print(navi);
      });
    });
  }

  void showPinsOnMap() {
    if (this.mounted) {
      // get a LatLng for the source location
      // from the LocationData currentLocation object
      try {
        var pinPosition = LatLng(13.652021, 100.493701);
        if (currentLocation != null) {
          var pinPosition =
              LatLng(currentLocation.latitude, currentLocation.longitude);
        }
        // get a LatLng out of the LocationData object
        var destPosition =
            LatLng(destinationLocation.latitude, destinationLocation.longitude);
        // add the initial source location pin
        _markers.add(Marker(
            markerId: MarkerId('sourcePin'),
            position: pinPosition,
            icon: sourceIcon));
        // destination pin
        _markers.add(Marker(
            markerId: MarkerId('destPin'),
            position: destPosition,
            icon: destinationIcon));
        _markers.add(Marker(markerId: MarkerId('LX'), position: destPosition));
        // set the route lines on the map from source to destination
        // for more info follow this tutorial
        setPolylines();
      } catch (e) {
        print('$e');
      }
    }
  }

  void setPolylines() async {
    if (this.mounted) {
      String url =
          "https://maps.googleapis.com/maps/api/directions/json?origin=${currentLocation.latitude},${currentLocation.longitude}&destination=${DEST_LOCATION.latitude},${DEST_LOCATION.longitude}&mode=driving&key=$apiKey";
      http.Response response = await http.get(url);
      Map values = jsonDecode(response.body);
      String route = values["routes"][0]["overview_polyline"]["points"];
      print(values);
      setState(() {
        _polylines.add(Polyline(
            polylineId: PolylineId('poly'),
            width: 4,
            points: _convertToLatLng(_decodePoly(route)),
            color: Colors.blue[900]));
      });
    }
  }

  List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    do {
      var shift = 0;
      int result = 0;

      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  void updatePinOnMap() async {
    if (this.mounted) {
      // create a new CameraPosition instance
      // every time the location changes, so the camera
      // follows the pin as it moves with an animation
      CameraPosition cPosition = CameraPosition(
        zoom: CAMERA_ZOOM,
        tilt: CAMERA_TILT,
        bearing: CAMERA_BEARING,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
      );
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
      // do this inside the setState() so Flutter gets notified
      // that a widget update is due
      setState(() {
        // updated position
        var pinPosition =
            LatLng(currentLocation.latitude, currentLocation.longitude);

        // the trick is to remove the marker (by id)
        // and add it again at the updated location
        _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
        _markers.add(Marker(
            markerId: MarkerId('sourcePin'),
            position: pinPosition, // updated position
            icon: sourceIcon));
        setPolylines();
      });
    }
  }
}
