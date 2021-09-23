import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../services/weather.dart';

import 'package:weather_app/utilities/constants.dart';

import 'package:weather_app/widgets/weather_card.dart';

class LocationInfoScreen extends StatefulWidget {
  LocationInfoScreen({this.city});

  final city;

  @override
  _LocationInfoScreenState createState() => _LocationInfoScreenState();
}

class _LocationInfoScreenState extends State<LocationInfoScreen> {
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

  @override
  void initState() {
    super.initState();

    getWeatherData() async {
      var weatherData =
          await weather.getCityWeather(widget.city).then((result) {
        updateUI(result);
      });
    }

    getWeatherData();
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        windSpeed = 0;
        humidity = 0;
        description = 'No Description';
        day = 'Today';

        return;
      } else {
        if (weatherData['coord'] != null) {
          dynamic temp = weatherData['main']['temp'];
          temperature = temp.toInt();

          dynamic wind = weatherData['wind']['speed'];
          windSpeed = wind.toInt();

          dynamic hum = weatherData['main']['humidity'];
          humidity = hum.toInt();

          dynamic timeStamp = weatherData['dt'];

          var date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
          day = DateFormat('EEEE, d MMMM').format(date);

          description = weatherData['weather'][0]['main'];

          var condition = weatherData['weather'][0]['id'];

          weatherIcon = weather.getWeatherIcon(condition);
          weatherMessage = weather.getMessage(temperature);

          cityName = weatherData['name'];
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
        body: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 105.h),
                  child: SvgPicture.asset('assets/svg/vector2.svg'),
                ),
                SvgPicture.asset('assets/svg/vector1.svg'),
              ],
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/svg/back.svg',
                              color: Colors.white,
                            ),
                            SizedBox(width: 30.w),
                            Text(cityName, style: headingTextStyle),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
