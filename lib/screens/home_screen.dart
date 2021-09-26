import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/weather.dart';

import 'package:weather_app/utilities/constants.dart';

import 'package:weather_app/widgets/weather_card.dart';

import 'package:weather_app/screens/notification_screen.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/screens/forecast_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.locationWeather});

  final locationWeather;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int temperature = 0;
  String weatherIcon = '';
  String cityName = '';
  String weatherMessage = '';
  int windSpeed = 0;
  int humidity = 0;
  String description = '';
  String day = '';

  String message = '';
  String conditionIcon = '';

  WeatherModel weather = WeatherModel();

  void _showModalSheet(String message, String conditionIcon) {
    showModalBottomSheet(
      context: context,
      builder: (builder) =>
          NotificationScreen(message: message, conditionIcon: conditionIcon),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.r),
          topLeft: Radius.circular(40.r),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = '';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        windSpeed = 0;
        humidity = 0;
        description = 'No Description';
        day = 'Today';

        return;
      } else {
        dynamic temp = weatherData['current']['temp'];
        temperature = temp.toInt();

        dynamic wind = weatherData['current']['wind_speed'];
        windSpeed = wind.toInt();

        dynamic hum = weatherData['current']['humidity'];
        humidity = hum.toInt();

        dynamic timeStamp = weatherData['current']['dt'];

        var date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
        day = DateFormat('EEEE, d MMMM').format(date);

        description = weatherData['current']['weather'][0]['main'];

        var condition = weatherData['current']['weather'][0]['id'];

        weatherIcon = weather.getWeatherIcon(condition);
        weatherMessage = weather.getMessage(temperature);

        cityName = weatherData['timezone'];
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
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.h),
                child: SvgPicture.asset('assets/svg/vector2.svg'),
              ),
              SvgPicture.asset('assets/svg/vector1.svg'),
            ],
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset(
                          'assets/svg/location_icon.svg',
                          color: Colors.white,
                        ),
                        onTap: () async {
                          Navigator.pushNamed((context), '/location');
                        },
                      ),
                      Text(cityName, style: headingTextStyle),
                      GestureDetector(
                        child: SvgPicture.asset(
                          'assets/svg/bell.svg',
                          color: Colors.white,
                        ),
                        onTap: () {
                          setState(() {
                            _showModalSheet(weatherMessage, weatherIcon);
                          });
                        },
                      ),
                    ],
                  ),
                  Center(
                    child: Text(weatherIcon, style: bodyWeatherIconTextStyle),
                  ),
                  WeatherCard(
                    day: day,
                    temp: temperature,
                    desc: description,
                    wind: windSpeed,
                    hum: humidity,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                        width: 230.w,
                        height: 60.h,
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForecastScreen(
                                weatherDataHistory: widget.locationWeather,
                              ),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          shadowColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        child: const Text('Forecast History',
                            style: buttonTextStyle),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
