// ignore_for_file: unnecessary_new

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationProvider with ChangeNotifier {
  late Location _location;
  Location get location => _location;
  late LatLng _locationPosition;
  LatLng get locationPosition => _locationPosition;

  bool locationServiceActive = true;

  LocationProvider() {
    _location = new Location();
  }

  double? get latitude => null;

  get longitude => null;
  initialization() {}
  getUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();

      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    } //ifelse statement ending, here we are seeing if the user has the location services enabled or not
    location.onLocationChanged.listen((LocationData currentLocation) {
      // print("////////////");
      //print(currentLocation.latitude);
      //print(currentLocation.longitude);
      // _locationPosition = LatLng(33.729832079212564, 73.03719651292022);

//nahi hoga aisy bcz jaa kr mappage par dekho latlng ko

      // ignore: non_constant_identifier_names

      // ignore: avoid_print
      print(_locationPosition);
      // ignore: avoid_print

      notifyListeners();
    });
  }
}
