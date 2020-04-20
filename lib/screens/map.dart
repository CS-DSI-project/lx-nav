import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
const LatLng DEST_LOCATION = LatLng(13.6520218,100.4937019);
const LatLng SOURCE_LOCATION = LatLng(42.747932,100.5339297);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 60;

class MapSample extends StatefulWidget {
  @override
 _MapState createState() => _MapState();
}

class _MapState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  LocationData currentLocation;
  // for my drawn routes on the map
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;
  Location location;
  LocationData destinationLocation;
  String googleAPIKey = '<AIzaSyBwCjS2AIbbPksdQlXMpQjDC1bhxiuRs9w>';
  // simple work map
  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(

      target: SOURCE_LOCATION
   );
if (currentLocation != null) {
      initialCameraPosition = CameraPosition(
         target: LatLng(currentLocation.latitude,
            currentLocation.longitude),

      );
   }
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Map"),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
         compassEnabled: true,
         zoomGesturesEnabled: false,
         indoorViewEnabled: true,
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
                position: LatLng(13.6520218, 100.4937019),
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
// @override
// Widget build(BuildContext context) {
//    CameraPosition initialCameraPosition = CameraPosition(

//       target: SOURCE_LOCATION
//    );
// if (currentLocation != null) {
//       initialCameraPosition = CameraPosition(
//          target: LatLng(currentLocation.latitude,
//             currentLocation.longitude),

//       );
//    }
// return Scaffold(
//       body: Stack(
//       children: <Widget>[
//          GoogleMap(
//          myLocationEnabled: true,
//          compassEnabled: true,
//          tiltGesturesEnabled: false,
//          markers: _markers,
//          polylines: _polylines,
//          mapType: MapType.normal,
//          initialCameraPosition: initialCameraPosition,
//          onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//             // my map has completed being created;
//             // i'm ready to show the pins on the map
//             showPinsOnMap();
//          })
//       ],
//     ),
//   );
// }



@override
void initState() {
   super.initState();
     
   // create an instance of Location
   location = new Location();
   polylinePoints = PolylinePoints();
   
   // subscribe to changes in the user's location
   // by "listening" to the location's onLocationChanged event
   location.onLocationChanged().listen((LocationData cLoc) {
      // cLoc contains the lat and long of the
      // current user's position in real time,
      // so we're holding on to it
      currentLocation = cLoc;
      updatePinOnMap();
   });
  // set custom marker pins
   setSourceAndDestinationIcons();
   // set the initial location
   setInitialLocation();
}
void setSourceAndDestinationIcons() async {
   sourceIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
         'assets/driving_pin.png');
  
   destinationIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(devicePixelRatio: 2.5),
         'assets/destination_map_marker.png');
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
void showPinsOnMap() {
   // get a LatLng for the source location
   // from the LocationData currentLocation object
   var pinPosition = LatLng(currentLocation.latitude,
   currentLocation.longitude);
   // get a LatLng out of the LocationData object
   var destPosition = LatLng(destinationLocation.latitude,
   destinationLocation.longitude);
   // add the initial source location pin
   _markers.add(Marker(
      markerId: MarkerId('sourcePin'),
      position: pinPosition,
      icon: sourceIcon
   ));
   // destination pin
   _markers.add(Marker(
      markerId: MarkerId('destPin'),
      position: destPosition,
      icon: destinationIcon
   ));
   // set the route lines on the map from source to destination
   // for more info follow this tutorial
   setPolylines();
}
void setPolylines() async {
   List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
   googleAPIKey,
   currentLocation.latitude,
   currentLocation.longitude,
   destinationLocation.latitude,
   destinationLocation.longitude);
   if(result.isNotEmpty){
      result.forEach((PointLatLng point){
         polylineCoordinates.add(
            LatLng(point.latitude,point.longitude)
         );
      });
     setState(() {
      _polylines.add(Polyline(
        width: 5, // set the width of the polylines
        polylineId: PolylineId('poly'),
        color: Color.fromARGB(255, 40, 122, 198), 
        points: polylineCoordinates
        ));
    });
  }
}
void updatePinOnMap() async {
   
   // create a new CameraPosition instance
   // every time the location changes, so the camera
   // follows the pin as it moves with an animation
   CameraPosition cPosition = CameraPosition(
   zoom: CAMERA_ZOOM,
   tilt: CAMERA_TILT,
   bearing: CAMERA_BEARING,
   target: LatLng(currentLocation.latitude,
      currentLocation.longitude),
   );
final GoogleMapController controller = await _controller.future;
controller.animateCamera(CameraUpdate.newCameraPosition(cPosition));
   // do this inside the setState() so Flutter gets notified
   // that a widget update is due
   setState(() {
      // updated position
      var pinPosition = LatLng(currentLocation.latitude,
      currentLocation.longitude);
      
      // the trick is to remove the marker (by id)
      // and add it again at the updated location
      _markers.removeWhere(
      (m) => m.markerId.value == 'sourcePin');
      _markers.add(Marker(
         markerId: MarkerId('sourcePin'),
         position: pinPosition, // updated position
         icon: sourceIcon
      ));
   });
}
}

