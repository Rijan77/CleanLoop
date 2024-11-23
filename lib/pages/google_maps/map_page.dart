import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.6564, 85.3420),
    zoom: 14.4746,
  );

  static const CameraPosition _pGooglePlex = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(27.6588, 85.3247
      ),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers:{
          Marker(markerId: MarkerId("_currentlocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: _kGooglePlex.target),
          Marker(markerId: MarkerId("_sourcelocation"),
          icon: BitmapDescriptor.defaultMarker,
          position: _pGooglePlex.target),

        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('Take me to location'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_pGooglePlex));
  }
}



