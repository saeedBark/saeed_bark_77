import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class weatherService {
  Future<WeatherModel> getweather({required String cityName}) async {
    WeatherModel? weatherData;
    Uri url = Uri.parse(
        'http://api.weatherapi.com/v1/forecast.json?key=b7960f1e23bb482399b83714221208&q=London&days=1&aqi=no&alerts=no');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
