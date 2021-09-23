import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_app/utilities/constants.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({
    this.day = '',
    this.temp = 0,
    this.desc = '',
    this.wind = 0,
    this.hum = 0,
  });

  String day;
  int temp;
  String desc;
  int wind;
  int hum;

  var toggle = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 380.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white.withOpacity(0.4),
        border: Border.all(
          color: const Color(0xffafc3d7),
          width: 3.5.w,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Text(
              day,
              style: cardTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: GestureDetector(
                child: Text('${temp.toString()}°', style: cardTempTextStyle),
                onTap: () {
                  if (toggle == 0) {
                    temp = int.parse(((temp * 9 / 5) + 32).toStringAsFixed(0));
                    toggle = 1;

                    (context as Element).markNeedsBuild();
                  } else {
                    temp = int.parse(((temp - 32) * 5 / 9).toStringAsFixed(0));
                    toggle = 0;

                    (context as Element).markNeedsBuild();
                  }
                }),
          ),
          Text(desc, style: cardStatusTextSyle),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset('assets/svg/wind.svg'),
                      const Text('Wind', style: cardTextStyle),
                      Text('${wind.toString()} km/h', style: cardTextStyle),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset('assets/svg/humidity.svg'),
                      const Text('Hum     ', style: cardTextStyle),
                      Text('${hum.toString()} %', style: cardTextStyle),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
