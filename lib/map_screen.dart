import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    Completer<GoogleMapController> controller0 =
        Completer<GoogleMapController>();

    CameraPosition kGooglePlex = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

    CameraPosition kLake = const CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(37.43296265331129, -122.08832357078792),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    Future<void> goToTheLake() async {
      final GoogleMapController controller = await controller0.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
    }

    return Scaffold(
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            controller0.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: goToTheLake,
          label: const Text('To the lake!'),
          icon: const Icon(Icons.directions_boat),
        ));
  }
}
