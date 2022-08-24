import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/provider_weather.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({this.updateUi});
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 35, horizontal: 24),
              hintText: 'Enter a city',
              suffixIcon: GestureDetector(
                  onTap: () async {
                    weatherService service = weatherService();
                    WeatherModel weather =
                        await service.getweather(cityName: cityName!);

                    Provider.of<WeatherProvider>(context, listen: false)
                        .weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false)
                        .cityName = cityName;

                    Navigator.pop(context);
                  },
                  child: Icon(Icons.search)),
              border: OutlineInputBorder(),
              label: Text('search'),
            ),
          ),
        ),
      ),
    );
  }
}
