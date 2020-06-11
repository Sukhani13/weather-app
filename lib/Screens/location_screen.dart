import 'package:flutter/material.dart';
import 'package:weather_app/Services/future_weather.dart';
import 'package:weather_app/Services/weather.dart';
import 'package:weather_app/Services/Text.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  final futureLocationWeather;
  LocationScreen(this.locationWeather, this.futureLocationWeather);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  FutureWeatherModel futureWeather = FutureWeatherModel();
  int temp;
  String cityName;
  String weatherIcon;
  String weatherCondition;
  int minTemp;
  int maxTemp;
  double windSpeed;

  int temp1;
  String weatherIcon1;
  String weatherCondition1;
  int temp2;
  String weatherIcon2;
  String weatherCondition2;
  int temp3;
  String weatherIcon3;
  String weatherCondition3;
  int temp4;
  String weatherIcon4;
  String weatherCondition4;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather, widget.futureLocationWeather);
  }

  void updateUI(dynamic weatherData, dynamic futureWeatherData) {
    setState(() {
      temp = (weatherData['main']['temp']).toInt();
      cityName = weatherData['name'];
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = WeatherText.getWeatherIcon(condition);
      weatherCondition = weatherData['weather'][0]['description'];
      minTemp = (weatherData['main']['temp_min']).toInt();
      maxTemp = (weatherData['main']['temp_max']).toInt();
      windSpeed = weatherData['wind']['speed'];

      temp1 = (futureWeatherData['list'][0]['main']['temp']).toInt();
      var condition1 = futureWeatherData['list'][0]['weather'][0]['id'];
      weatherIcon1 = WeatherText.getWeatherIcon(condition1);
      weatherCondition1 =
          futureWeatherData['list'][0]['weather'][0]['description'];

      temp2 = (futureWeatherData['list'][1]['main']['temp']).toInt();
      var condition2 = futureWeatherData['list'][1]['weather'][0]['id'];
      weatherIcon2 = WeatherText.getWeatherIcon(condition2);
      weatherCondition2 =
          futureWeatherData['list'][1]['weather'][0]['description'];

      temp3 = (futureWeatherData['list'][3]['main']['temp']).toInt();
      var condition3 = futureWeatherData['list'][3]['weather'][0]['id'];
      weatherIcon3 = WeatherText.getWeatherIcon(condition3);
      weatherCondition3 =
          futureWeatherData['list'][3]['weather'][0]['description'];

      temp4 = (futureWeatherData['list'][7]['main']['temp']).toInt();
      var condition4 = futureWeatherData['list'][7]['weather'][0]['id'];
      weatherIcon4 = WeatherText.getWeatherIcon(condition4);
      weatherCondition4 =
          futureWeatherData['list'][7]['weather'][0]['description'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back_ios,
            size: 35,
          ),
          onPressed: () => {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false),
          },
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              var weatherData = await weather.getLocationWeather();
              var futureWeatherData = await futureWeather.getLocationWeather();
              updateUI(weatherData, futureWeatherData);
            },
            child: Icon(
              Icons.refresh,
              size: 35,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                children: <Widget>[
                  Text(
                    "$temp° C  $weatherIcon",
                    style: TextStyle(
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    "$cityName",
                    style: TextStyle(
                      fontSize: 32,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    "At present : $weatherCondition",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "Minimum temp : ${minTemp - 1}° C\nMaximum temp : ${maxTemp + 1}° C",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "Wind Speed : $windSpeed m/s",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Divider(
                    thickness: 5,
                  ),
                  Text(
                    "After 3 hours",
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    "$temp1° C  $weatherIcon1",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "$weatherCondition1",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    "After 6 hours",
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    "$temp2° C  $weatherIcon2",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "$weatherCondition2",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    "After 12 hours",
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    "$temp3° C  $weatherIcon3",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "$weatherCondition3",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                    "After 1 day",
                    style: TextStyle(fontSize: 22),
                  ),
                  Text(
                    "$temp4° C  $weatherIcon4",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "$weatherCondition4",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
