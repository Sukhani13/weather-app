import 'package:flutter/material.dart';

class AlertScreen extends StatefulWidget {
  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("ERROR"),
      content: Text(
          "An unexpected error has occured either because of the server side or due to no permission of location services or due to wrong name of the city.\nPlease try again after some time."),
      actions: <Widget>[
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          },
        ),
      ],
    );
  }
}
