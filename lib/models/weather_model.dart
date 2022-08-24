import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double mintemp;
  String weatherStateName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxTemp,
      required this.mintemp,
      required this.weatherStateName});
  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    // temp = jsonData['avgtemp_c'];
    //   maxTemp = jsonData['maxtemp_c'];
    //   mintemp = jsonData['mintemp_c'];
    //   weatherStateName = jsonData['condition']['text'];
    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        mintemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }
  @override
  String toString() {
    // TODO: implement toString
    return 'date = $date temp = $temp maxTemp = $maxTemp minTemp = $mintemp state = $weatherStateName';
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Overcast') {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm') {
      return 'assets/images/Thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherStateName == 'Sleet' ||
        weatherStateName == 'Snow' ||
        weatherStateName == 'Hail') {
      return Colors.blue;
    } else if (weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Overcast') {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers') {
      return Colors.purple;
    } else if (weatherStateName == 'Thunderstorm') {
      return Colors.yellow;
    } else {
      return Colors.blueGrey;
    }
  }
}
