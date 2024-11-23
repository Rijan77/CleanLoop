import 'dart:async';

import 'package:cleanloop/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}
class _MapPageState extends State<MapPage> {
  Location _locationController = new Location();

  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(27.6564, 85.3420);
  static const LatLng _kGooglePlex = LatLng(27.6588, 85.3247);

  LatLng? _currentPosition = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPosition == null ? const Center(child: Text("Loading...."),):
      GoogleMap( onMapCreated: ((GoogleMapController controller) => _mapController.complete(controller)), initialCameraPosition:
      CameraPosition(target: _pGooglePlex,
      zoom: 13),
        markers:{
          Marker(markerId: MarkerId("_currentLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _currentPosition!,
          ),
        Marker(markerId: MarkerId("_sourceLocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: _pGooglePlex
        ),
          Marker(markerId: MarkerId("_destinationLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _kGooglePlex
          ),
        },
      ),

    );
  }
  Future<void> _cameraToPosition(LatLng pos) async{
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newPosition = CameraPosition(target: pos , zoom: 13, );
    await controller.animateCamera(CameraUpdate.newCameraPosition(_newPosition),);
  }
  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    print("Service Enabled: $_serviceEnabled");

    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      print("Requested Service: $_serviceEnabled");
      if (!_serviceEnabled) {
        print("Service not enabled");
        return;
      }
    }

    _permissionGranted = await _locationController.hasPermission();
    print("Permission Granted: $_permissionGranted");

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("Permission not granted");
        return;
      }
    }

    print("Starting location updates...");
    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      print("Location: ${currentLocation.latitude}, ${currentLocation.longitude}");
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentPosition!);
        });
      }
    });
  }

// Future<void> drawRoutePolyline() async {
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     GOOGLE_MAPS_API_KEY, // Replace with your actual API key
  //     PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
  //     PointLatLng(_kGooglePlex.latitude, _kGooglePlex.longitude),
  //     travelMode: TravelMode.driving, request: null,
  //   );
}
