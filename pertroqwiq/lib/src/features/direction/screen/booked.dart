// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class BookedScreen extends StatefulWidget {
  const BookedScreen({super.key});

  @override
  State<BookedScreen> createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookedScreen> {
  Location _locationController = new Location();

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  static const LatLng _pGooglePlex = LatLng(37.42223, -122.0848);
  static const LatLng _pGooglePlex1 = LatLng(37.3346, -122.0090);
  LatLng? _currentPosition = null;

  Map<PolylineId, Polyline> polyLines = {};

  @override
  void initState() {
    print('ad asd asd asd asdasdasdasdasdas');
    // TODO: implement initState
    super.initState();
    try {
      getLocationUpdate().then((value) => {
            getPolylinePoints()
                .then((coor) => {generatePolyLinsFromPoints(coor)})
          });
    } on Exception catch (error) {
      print(error);
      print('sdasdasd');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPosition == null
          ? Center(
              child: Text('Loading....'),
            )
          : GoogleMap(
              // onMapCreated: ((GoogleMapController controller) =>
              //     _mapController.complete(controller)),
              initialCameraPosition:
                  CameraPosition(target: _pGooglePlex, zoom: 11),
              markers: {
                Marker(
                    markerId: MarkerId('wew'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pGooglePlex),
                Marker(
                    markerId: MarkerId('wow'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pGooglePlex1),
              },
              polylines: Set<Polyline>.of(polyLines.values),
            ),
    );
  }

  void generatePolyLinsFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.black,
        points: polylineCoordinates,
        width: 2);

    setState(() {
      polyLines[id] = polyline;
    });
  }

  Future<void> cameraToPostion(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPostion = CameraPosition(target: pos, zoom: 10);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPostion));
  }

  Future<void> getLocationUpdate() async {
    try {
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;

      _serviceEnabled = await _locationController.serviceEnabled();

      if (_serviceEnabled) {
        _serviceEnabled = await _locationController.requestService();
      } else {
        return;
      }

      _permissionGranted = await _locationController.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await _locationController.requestPermission();

        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      } else {}

      _locationController.onLocationChanged
          .listen((LocationData currentLocation) {
        if (currentLocation.latitude != null &&
            currentLocation.longitude != null) {
          setState(() {
            _currentPosition =
                LatLng(currentLocation.latitude!, currentLocation.longitude!);
            cameraToPostion(_currentPosition!);
          });
          print(_currentPosition);
        }
      });
    } on Exception catch (error) {
      print(error);
    }
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyDLlUT5h92XtiUVVC5yD6rH6oNbN5Zq_1A',
        PointLatLng(_pGooglePlex.latitude, _pGooglePlex.longitude),
        PointLatLng(_pGooglePlex1.latitude, _pGooglePlex1.longitude),
        travelMode: TravelMode.driving);

    if (result.points.isNotEmpty) {
      result.points.forEach((element) {
        polylineCoordinates.add(LatLng(element.latitude, element.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }
}
