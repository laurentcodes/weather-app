import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

class Forecast extends StatelessWidget {
  Forecast({this.temp = 0, this.icon = '', this.date = ''});

  int temp;
  String icon;
  String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(date, style: bodyTextStyle),
          Text(icon, style: bodyTextIconStyle),
          Text('$temp°', style: bodyTextStyle),
        ],
      ),
    );
  }
}
