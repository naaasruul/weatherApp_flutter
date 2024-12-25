import 'package:climaflutter/services/networking.dart';
import 'package:climaflutter/services/location.dart';

const apiKey = '309b4bb1b5c6c8da17aac8ed00cc6b48';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';
// https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
class WeatherModel {


  Future <dynamic> getCityWeater(String cityName) async{
  var url = '$openWeatherMap?q=$cityName&appid=$apiKey&units=metric';
  NetworkHelper networkHelper = NetworkHelper(url);

  var weatherData = networkHelper.getData();
  return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMap?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
