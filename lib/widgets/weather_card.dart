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

  var toggle = 0;

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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              day,
              style: cardTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
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
