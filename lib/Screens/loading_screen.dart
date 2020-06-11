import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/Services/future_weather.dart';
import 'package:weather_app/Services/weather.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  final String name;
  LoadingScreen(this.name);
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.name == "") {
      getLocationData();
    } else {
      getCityData();
    }
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    var futureWeatherData = await FutureWeatherModel().getLocationWeather();
    Navigator.of(context).pushNamed(
      '/third',
      arguments: {weatherData, futureWeatherData},
    );
  }

  void getCityData() async {
    var weatherData = await WeatherModel().getCityWeather("${widget.name}");
    var futureWeatherData =
        await FutureWeatherModel().getCityWeather("${widget.name}");
    if (weatherData == null || futureWeatherData == null) {
      Navigator.pushNamed(context, '/fourth');
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          weatherData,
          futureWeatherData,
        );
      }));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
