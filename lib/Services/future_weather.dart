import 'location.dart';
import 'networking.dart';

const apiKey = '0c7b914545e3b60be83c2991b3bc6f6f';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/forecast';

class FutureWeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var futureWeatherData = await networkHelper.getData();
    return futureWeatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var futureWeatherData = await networkHelper.getData();
    return futureWeatherData;
  }
}
