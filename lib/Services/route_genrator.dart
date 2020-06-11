import 'package:flutter/material.dart';
import 'package:weather_app/Screens/alert_screen.dart';
import 'package:weather_app/Screens/first_screen.dart';
import 'package:weather_app/Screens/loading_screen.dart';
import 'package:weather_app/Screens/location_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => FirstScreen());
      case '/second':
        return MaterialPageRoute(builder: (_) => LoadingScreen(args));
      case '/third':
        return MaterialPageRoute(builder: (_) => LocationScreen(args, args));
      case '/fourth':
        return MaterialPageRoute(builder: (_) => AlertScreen());
    }
    return _errorRoute();
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      body: Center(
        child: Text("ERROR"),
      ),
    );
  });
}
