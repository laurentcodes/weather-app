// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/forecast_screen.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/screens/notification_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: () => MaterialApp(
        title: 'Weather App',
        initialRoute: '/',
        routes: {
          '/': (context) => LoadingScreen(),
          '/home': (context) => HomeScreen(),
          '/forecast': (context) => ForecastScreen(),
          '/location': (context) => const LocationScreen(),
          '/notif': (context) => NotificationScreen(),
        },
        theme: ThemeData(textTheme: GoogleFonts.overpassTextTheme()),
      ),
    );
  }
}
