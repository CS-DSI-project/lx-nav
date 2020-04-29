import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lxnav/components/map_pin_pill.dart';
import 'package:lxnav/models/pin_pill_info.dart';

const LatLng SOURCE_LOCATION = LatLng(13.655154, 100.497864);
const LatLng DEST_LOCATION = LatLng(13.652021, 100.493701);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class MapSample extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapSample> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}