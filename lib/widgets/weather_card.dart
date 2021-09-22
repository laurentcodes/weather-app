import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 310.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.4),
        border: Border.all(
          color: const Color(0xffafc3d7),
          width: 3.5,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              day,
              style: cardTextStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('${temp.toString()}°', style: cardTempTextStyle),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(desc, style: cardStatusTextSyle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/svg/wind.svg'),
              const Text('Wind', style: cardTextStyle),
              // const Text('|', style: cardTextStyle),
              Text('${wind.toString()} km/h', style: cardTextStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/svg/humidity.svg'),
              const Text('Hum     ', style: cardTextStyle),
              // const Text('|', style: cardTextStyle),
              Text('${hum.toString()} %', style: cardTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}
