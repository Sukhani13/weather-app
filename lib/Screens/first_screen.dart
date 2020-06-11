import 'package:flutter/material.dart';
import 'package:weather_app/Screens/loading_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter city name",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                ),
                MaterialButton(
                    child: Text("Enter"),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/second',
                        arguments: cityName,
                      );
                    }),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            MaterialButton(
              child: Text("Get Live Location Weather"),
              color: Colors.green,
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoadingScreen("");
                    },
                  ),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
