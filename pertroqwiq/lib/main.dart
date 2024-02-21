import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pertroqwiq/src/features/direction/screen/booked.dart';
import 'package:pertroqwiq/src/features/home/screen/home.dart';
import 'package:pertroqwiq/src/features/login/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Future<bool> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('>>>>>>>>>>>>>>>>>>>>>>');
    print(prefs.getString('loginData'));
    return prefs.getString('loginData') != null ? true : false;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, widget) {
        Widget error = const Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(body: Center(child: error));
        }
        ErrorWidget.builder = (errorDetails) => error;
        if (widget != null) return widget;
        throw StateError('widget is null');
      },
      home: FutureBuilder(
          future: checkLogin(),
          builder: (context, AsyncSnapshot<bool> snapshop) {
            print(' asd asd asd asd asdasdas ');
            print(snapshop.data);
            return snapshop.data == true ? HomeScreen() : LoginScreen();
          }),
    );
  }
}
