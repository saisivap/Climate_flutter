import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
// import 'package:clima/services/location.dart';
// import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {
   var wetherdata=await WeatherModel().getLocationWeather();
    // print(wetherdata);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationData: wetherdata,
        ),
      ),
    );
  }

  void msg() {
    print("hey hello this is me..!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitRotatingPlain(
        color: Colors.white70,
        size: 50,
      )),
    );
  }
}
