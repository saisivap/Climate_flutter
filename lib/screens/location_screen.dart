import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationData});
  final locationData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp;
  String cityName;
  String climateType;
  int condition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var data = widget.locationData;
    locationWeatherData(data);
  }

  void locationWeatherData(var data) {
    setState(() {
      temp = (data['main']['temp']).toInt();
      cityName = data['name'];
      climateType = data['weather'][0]['main'];
      condition = data['weather'][0]['id'];

      print(temp);
      print(cityName);
      print(climateType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var wetherdata =
                          await WeatherModel().getLocationWeather();
                      locationWeatherData(wetherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var name = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CityScreen()));
                      print(name);
                      var wetherdata =
                          await WeatherModel().getCityWeather(name);
                      if (wetherdata != null) {
                        locationWeatherData(wetherdata);
                      } 
                      // else {
                      //   Alert(
                      //     context: context,
                      //     title: "Not found",
                      //     desc: "The Place or Location Not found",
                      //     buttons: [
                      //       DialogButton(
                      //         child: Text(
                      //           "COOL",
                      //           style: TextStyle(
                      //               color: Colors.white, fontSize: 20),
                      //         ),
                      //         onPressed: () => Navigator.pop(context),
                      //         width: 120,
                      //         color: Color.fromRGBO(255, 100, 100, 1.0),
                      //       )
                      //     ],
                      //   ).show();
                      // }
                      //  print(wetherdata);
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temp \u2103',
                      style: kTempTextStyle,
                    ),
                    Text(
                      // '☀️',
                      WeatherModel().getWeatherIcon(condition),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  // "It's 🍦 time in San Francisco!",
                  "${WeatherModel().getMessage(temp)} in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
