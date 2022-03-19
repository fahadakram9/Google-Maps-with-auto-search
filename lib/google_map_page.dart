// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, prefer_typing_uninitialized_variables
// import 'dart:collection';
// ignore: avoid_web_libraries_in_flutter
//import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapPage extends StatefulWidget {
  GoogleMapPage({Key? key}) : super(key: key);

  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  // ignore: prefer_final_fields
  // Set<Marker> _marker = {};
  //var myMarkers = HashSet<Marker>();
  late LatLng currentPostion;
  late LatLng _center;
  late Position currentLocation;

  @override
  void initState() {
    super.initState();
    getUserLocation();
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    // ignore: avoid_print
    print('center: $_center');
  }

  // void _getUserLocation() async {
  //   var position = await GeolocatorPlatform.instance
  //       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  //   setState(() {
  //     currentPostion = LatLng(position.latitude, position.longitude);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // var myMarkers;
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text('Google Map'),
        backgroundColor: Colors.green,
      ),
      body: Stack(children: [
        // ignore: prefer_const_constructors, duplicate_ignore, duplicate_ignore
        //Expanded(
        // ignore: prefer_const_constructors
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target:
                  LatLng(currentLocation.latitude, currentLocation.longitude),
              zoom: 17),
          //target: LatLng(33.729832079212564, 73.03719651292022), zoom: 8),
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          zoomControlsEnabled: true,
          compassEnabled: true,
          trafficEnabled: true,
          onMapCreated: (GoogleMapController mapController) {
            // setState(() {
            //   myMarkers.add(
            //     Marker(
            //         markerId: MarkerId('currentLocation'),
            //         infoWindow: InfoWindow(title: 'Current Position'),
            //         position: LatLng(
            //             currentLocation.latitude, currentLocation.longitude),
            //         icon: BitmapDescriptor.defaultMarkerWithHue(
            //           BitmapDescriptor.hueRed,
            //         )),
            //   );
            // });
          },
          // markers: myMarkers,
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.location_searching),
        onPressed: () {
          // GoogleMapPage();
        },
      ),
    );
  }
}
