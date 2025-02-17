import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String googleAPiKey = "AIzaSyBC-Vqf1uWwI6t57xo00OnzBf6LcqxsQ2E";
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng sourceLocation = LatLng(-1.2048754551598329, 36.910607512531456);
  static const LatLng finalLocation = LatLng(-1.0712151183174405, 36.62940146189086);

  List<LatLng> polyCoordinates = [];
  LocationData? currentLocatioN;
  String placeName = "Loading...";

  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocatioN = location;
    });
    location.onLocationChanged.listen((newLoc) {
      currentLocatioN = newLoc;
      setState(() {});
    });
  }

  Future<void> getPlaceName(LatLng location) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${location.latitude},${location.longitude}&key=$googleAPiKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['results'].isNotEmpty) {
        setState(() {
          placeName = data['results'][0]['formatted_address'];
        });
      }
    }
  }

  Future<void> _goToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    if (currentLocatioN != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(currentLocatioN!.latitude!, currentLocatioN!.longitude!),
            zoom: 15,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    getCurrentLocation();
    getPlaceName(finalLocation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          currentLocatioN == null
              ? const Center(child: Text("Loading..."))
              : GoogleMap(
            initialCameraPosition: CameraPosition(
              target: sourceLocation,
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: {
              Marker(
                markerId: MarkerId('source'),
                position: LatLng(currentLocatioN!.latitude!, currentLocatioN!.longitude!),
                infoWindow: InfoWindow(
                  title: placeName,
                ),
              ),
            },
          ),
          Positioned(
            top: 145,
            right: 5,
            child: FloatingActionButton(

              onPressed: _goToCurrentLocation,
              child: Icon(Icons.my_location,),
            ),
          ),
        ],
      ),
    );
  }
}
