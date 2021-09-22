import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/utilities/history_hour_item.dart';
import '../services/weather.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/today_temps.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({this.weatherDataHistory});

  final weatherDataHistory;

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List fiveHoursTemp = [];
  List fiveHoursTime = [];
  List fiveHoursIcon = [];

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

        for (int i = 0; i < fiveHoursData.length; i++) {
          var date = DateTime.fromMillisecondsSinceEpoch(
              fiveHoursData[i]['dt'] * 1000);
          var day = DateFormat('HH:MM').format(date);

          var condition = fiveHoursData[i]['weather'][0]['id'];

          var weatherIcon = weather.getWeatherIcon(condition);

          fiveHoursTemp.add(fiveHoursData[i]['temp']);
          fiveHoursTime.add(day);
          fiveHoursIcon.add(weatherIcon);
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
                          'Today',
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
                          'History - Last 5 Days',
                          style: historyHeadingTextStyle,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Sep, 13', style: bodyTextStyle),
                                  Text('🌩', style: bodyTextIconStyle),
                                  Text('21°', style: bodyTextStyle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Sep, 14', style: bodyTextStyle),
                                  Text('🌧', style: bodyTextIconStyle),
                                  Text('22°', style: bodyTextStyle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Sep, 15', style: bodyTextStyle),
                                  Text('☀️', style: bodyTextIconStyle),
                                  Text('34°', style: bodyTextStyle),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Sep, 16', style: bodyTextStyle),
                                  Text('☁️', style: bodyTextIconStyle),
                                  Text('27°', style: bodyTextStyle),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text('Sep, 17', style: bodyTextStyle),
                                Text('🌫', style: bodyTextIconStyle),
                                Text('32°', style: bodyTextStyle),
                              ],
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
