import 'package:climaflutter/screens/location_screen.dart';
import 'package:climaflutter/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:climaflutter/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '309b4bb1b5c6c8da17aac8ed00cc6b48';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat = 0.0;
  double lon = 0.0;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getData() async {}

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
        ),
      ),
    );
  }
}
