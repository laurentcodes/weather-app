import 'package:flutter/material.dart';

import 'package:weather_app/utilities/constants.dart';

class TodayTemps extends StatelessWidget {
  TodayTemps({this.temp = 0, this.icon = '', this.time = ''});

  int temp;
  String icon;
  String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$temp°C', style: bodyTextStyle),
        Text(icon, style: bodyTextIconStyle),
        Text(time, style: bodyTextStyle),
      ],
    );
  }
}
