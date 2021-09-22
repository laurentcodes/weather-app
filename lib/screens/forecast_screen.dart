import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utilities/constants.dart';
import '../services/weather.dart';
import 'package:intl/intl.dart';

import 'package:weather_app/widgets/today_temps.dart';
import 'package:weather_app/widgets/forecast.dart';

class ForecastScreen extends StatefulWidget {
  ForecastScreen({this.weatherDataHistory});

  final weatherDataHistory;

  @override
  _ForecastScreenState createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  List fiveHoursTemp = [];
  List fiveHoursTime = [];
  List fiveHoursIcon = [];

  List fiveDaysTemp = [];
  List fiveDaysDate = [];
  List fiveDaysIcon = [];

  WeatherModel weather = WeatherModel();

  @override
  void initState() {
    super.initState();

    updateUI(widget.weatherDataHistory);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        return;
      } else {
        List<dynamic> hourly = weatherData['hourly'];
        List<dynamic> fiveHoursData = hourly.sublist(0, 6);

        List<dynamic> daily = weatherData['daily'];
        List<dynamic> fiveDaysData = daily.sublist(1, 7);

        for (int i = 0; i < fiveHoursData.length; i++) {
          var dateFiveHours = DateTime.fromMillisecondsSinceEpoch(
              fiveHoursData[i]['dt'] * 1000);
          var day = DateFormat('HH:MM').format(dateFiveHours);

          var dateFiveDays =
              DateTime.fromMillisecondsSinceEpoch(fiveDaysData[i]['dt'] * 1000);
          var date = DateFormat('MMM, d').format(dateFiveDays);

          var conditionFiveHours = fiveHoursData[i]['weather'][0]['id'];
          var weatherIconFiveHours = weather.getWeatherIcon(conditionFiveHours);

          var conditionFiveDays = fiveDaysData[i]['weather'][0]['id'];
          var weatherIconFiveDays = weather.getWeatherIcon(conditionFiveDays);

          fiveHoursTemp.add(fiveHoursData[i]['temp']);
          fiveHoursTime.add(day);
          fiveHoursIcon.add(weatherIconFiveHours);

          fiveDaysTemp.add(fiveDaysData[i]['temp']['day']);
          fiveDaysDate.add(date);
          fiveDaysIcon.add(weatherIconFiveDays);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xff47bfdf), Color(0xff4a91ff)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(top: 105.0),
              child: SvgPicture.asset('assets/svg/vector2.svg'),
            ),
            SvgPicture.asset('assets/svg/vector1.svg'),
          ]),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/svg/back.svg',
                                color: Colors.white,
                              ),
                              const SizedBox(width: 15),
                              const Text('Back', style: headingTextStyle),
                            ],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        SvgPicture.asset(
                          'assets/svg/settings.svg',
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0, left: 30.0),
                        child: Text(
                          'Today - 5 Hours',
                          style: historyHeadingTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TodayTemps(
                              temp: fiveHoursTemp[0].toInt(),
                              icon: fiveHoursIcon[0],
                              time: fiveHoursTime[0],
                            ),
                            TodayTemps(
                              temp: fiveHoursTemp[1].toInt(),
                              icon: fiveHoursIcon[1],
                              time: fiveHoursTime[1],
                            ),
                            TodayTemps(
                              temp: fiveHoursTemp[2].toInt(),
                              icon: fiveHoursIcon[2],
                              time: fiveHoursTime[2],
                            ),
                            TodayTemps(
                              temp: fiveHoursTemp[3].toInt(),
                              icon: fiveHoursIcon[3],
                              time: fiveHoursTime[3],
                            ),
                            TodayTemps(
                              temp: fiveHoursTemp[4].toInt(),
                              icon: fiveHoursIcon[4],
                              time: fiveHoursTime[4],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0, left: 30.0),
                        child: Text(
                          'Forecast - Next 5 Days',
                          style: historyHeadingTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          children: [
                            Forecast(
                              temp: fiveDaysTemp[0].toInt(),
                              date: fiveDaysDate[0],
                              icon: fiveDaysIcon[0],
                            ),
                            Forecast(
                              temp: fiveDaysTemp[1].toInt(),
                              date: fiveDaysDate[1],
                              icon: fiveDaysIcon[1],
                            ),
                            Forecast(
                              temp: fiveDaysTemp[2].toInt(),
                              date: fiveDaysDate[2],
                              icon: fiveDaysIcon[2],
                            ),
                            Forecast(
                              temp: fiveDaysTemp[3].toInt(),
                              date: fiveDaysDate[3],
                              icon: fiveDaysIcon[3],
                            ),
                            Forecast(
                              temp: fiveDaysTemp[4].toInt(),
                              date: fiveDaysDate[4],
                              icon: fiveDaysIcon[4],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
