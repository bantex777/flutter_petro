// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pertroqwiq/src/common_widgets/loading.dart';
import 'package:pertroqwiq/src/constants/navbar.dart';
import 'package:pertroqwiq/src/features/login/screen/login.dart';
import 'package:pertroqwiq/src/features/order/screen/order.dart';
import 'package:pertroqwiq/src/features/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../widget/slidingUp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  BitmapDescriptor icon = BitmapDescriptor.defaultMarker;
  String _mapStyle = "";
  late GoogleMapController mapController;

  final List<Marker> _trucks = [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(14.459024, 121.200394),
        infoWindow: InfoWindow(title: 'truck 1')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(14.459026, 121.200396),
        infoWindow: InfoWindow(title: 'truck 2')),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(14.459028, 121.200398),
        infoWindow: InfoWindow(title: 'truck 2'))
  ];

  //Directions _info;

  @override
  void initState() {
    getIcons();
    _delayScreen();
    rootBundle.loadString('assets/map_style.json').then((string) {
      _mapStyle = string;
    });
    super.initState();
  }

  _delayScreen() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  getIcons() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 3.2), "assets/marker.gif")
        .then((value) => {
              setState(() {
                icon = value;
              })
            });
  }

  Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('loginData');
    return prefs.getString('loginData') == null ? true : false;
  }

  @override
  Widget build(BuildContext context) => isLoading
      ? Loading()
      : Scaffold(
          drawer: const NavBar(),
          body: SlidingUpPanel(
            borderRadius: BorderRadius.circular(60),
            minHeight: 320,
            maxHeight: 620,
            panel: SlidingUp(),
            body: Stack(children: [
              GoogleMap(
                zoomGesturesEnabled: false,
                scrollGesturesEnabled: false,
                tiltGesturesEnabled: false,
                rotateGesturesEnabled: false,
                zoomControlsEnabled: false,
                markers: {
                  Marker(
                      markerId: MarkerId('1'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrderScreen()),
                        );
                      },
                      icon: icon,
                      position: LatLng(14.469024, 121.209394),
                      infoWindow: InfoWindow(title: 'truck 1')),
                  Marker(
                      markerId: MarkerId('2'),
                      icon: icon,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrderScreen()),
                        );
                      },
                      position: LatLng(14.455026, 121.205596),
                      infoWindow: InfoWindow(title: 'truck 2')),
                  Marker(
                      markerId: MarkerId('2'),
                      icon: icon,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrderScreen()),
                        );
                      },
                      position: LatLng(14.449928, 121.201198),
                      infoWindow: InfoWindow(title: 'truck 2')),
                  Marker(
                      markerId: MarkerId('2'),
                      icon: icon,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OrderScreen()),
                        );
                      },
                      position: LatLng(14.449928, 121.201898),
                      infoWindow: InfoWindow(title: 'truck 2'))
                },
                initialCameraPosition: CameraPosition(
                    target: LatLng(14.459023, 121.200393), zoom: 14.21),
                onMapCreated: (GoogleMapController map) {
                  mapController = map;
                  mapController.setMapStyle(_mapStyle);
                },
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: InkWell(
                      onTap: () {
                        FutureBuilder(
                            future: logOut(),
                            builder: (context, AsyncSnapshot<bool> snapshop) {
                              print(snapshop.data);
                              return snapshop.data == true
                                  ? LoginScreen()
                                  : HomeScreen();
                            });
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black,
                                  offset: Offset(1, 3))
                            ] // Make rounded corner of border
                            ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const MyProfile()));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                                color: Color.fromARGB(77, 255, 235, 235)),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.black,
                                  offset: Offset(1, 3))
                            ] // Make rounded corner of border
                            ),
                        child: Image(image: AssetImage('assets/bata.jpg')),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
}
