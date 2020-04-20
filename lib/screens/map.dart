import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
class MapSample extends StatefulWidget {
  @override
 _MapState createState() => _MapState();
}

class _MapState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  LocationData currentLocation;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Map"),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: LatLng(13.651881, 100.494545),
            zoom: 16,
          ),
          markers: {
            Marker(
                markerId: MarkerId("1"),
                position: LatLng(13.6491634, 100.492828),
                infoWindow: InfoWindow(title: "มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี", snippet: "KMUTT")),
            Marker(markerId: MarkerId("2"),
                position: LatLng(13.651881, 100.494545),
                infoWindow: InfoWindow(title: "อาคารพหุวิทยาการ LX", snippet: "KMUTT")
            )
          },onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        ),
        floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToMe,
        label: Text('My location'),
        icon: Icon(Icons.near_me),
      ),
    );
  }
  Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // Permission denied
      }
      return null;
    }
  }
   Future _goToMe() async {
    final GoogleMapController controller = await _controller.future;
    currentLocation = await getCurrentLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
              currentLocation.latitude,
              currentLocation.longitude),
          zoom: 16,
        )));
  }
}