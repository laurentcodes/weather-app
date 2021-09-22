// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/history_screen.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/screens/notification_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/history': (context) => const HistoryScreen(),
        '/location': (context) => const LocationScreen(),
        '/notif': (context) => const NotificationScreen(),
      },
      theme: ThemeData(textTheme: GoogleFonts.overpassTextTheme()),
    );
  }
}
