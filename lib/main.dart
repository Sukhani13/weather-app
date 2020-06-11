import 'package:flutter/material.dart';
import 'package:weather_app/Screens/first_screen.dart';
import 'package:weather_app/Services/route_genrator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: FirstScreen(),
    );
  }
}
