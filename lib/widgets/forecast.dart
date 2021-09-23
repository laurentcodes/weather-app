import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Forecast extends StatelessWidget {
  Forecast({this.temp = 0, this.icon = '', this.date = ''});

  int temp;
  String icon;
  String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
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
