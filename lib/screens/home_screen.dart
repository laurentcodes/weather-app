import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/utilities/constants.dart';
import '../services/weather.dart';
import 'package:weather_app/screens/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.locationWeather});

  final locationWeather;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel weather = WeatherModel();

  @override
  Widget build(BuildContext context) {
    // var weatherData = weather.getCityWeather('London');

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
                          onTap: () {
                            Navigator.pushNamed(context, '/location');
                          }),
                      const Text('Surabaya', style: headingTextStyle),
                      GestureDetector(
                        child: SvgPicture.asset(
                          'assets/svg/bell.svg',
                          color: Colors.white,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => const NotificationScreen(),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                            )),
                          );
                        },
                      ),
                    ],
                  ),
                  Center(
                    child: Image.asset('assets/images/sunny.png'),
                  ),
                  Container(
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Today, 12 September',
                            style: cardTextStyle,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text('29°', style: cardTempTextStyle),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Sunny', style: cardStatusTextSyle),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('assets/svg/wind.svg'),
                            const Text('Wind', style: cardTextStyle),
                            // const Text('|', style: cardTextStyle),
                            const Text('10 km/h', style: cardTextStyle),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset('assets/svg/humidity.svg'),
                            const Text('Hum     ', style: cardTextStyle),
                            // const Text('|', style: cardTextStyle),
                            const Text('54 %', style: cardTextStyle),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(
                          width: 230.0, height: 60.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/history');
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          shadowColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        child: const Text('History', style: buttonTextStyle),
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
